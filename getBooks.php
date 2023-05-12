<?php
// Bắt đầu phiên
session_start();

// Bao gồm tệp connectdatabase.php để có kết nối cơ sở dữ liệu
require 'connectdatabase.php';

// Xử lý yêu cầu POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Lấy giá trị id từ yêu cầu POST
    $id = $_POST["id"];
    $type = $_POST["type"];

    if ($type == "book") {
        $book = getBookById($id);
        echo json_encode($book);
    } else {
        $bookList = getBookListById($id);
        echo json_encode($bookList);
    }
}

$conn->close();

function getBookById($id)
{
    global $conn;
    $id = $conn->real_escape_string($id);
    $sql = "SELECT * FROM books WHERE book_id = '$id'";
    $result = getBookListFromQuery($sql);
    return ($result) ? $result[0] : null;
}


function getBookListById($id)
{
    global $conn;
    $id = $conn->real_escape_string($id);

    if ($id == "Featured") {
        $sql = "SELECT * FROM books ORDER BY rating DESC LIMIT 10";
    } else {
        $sql = "SELECT * FROM books INNER JOIN list_books ON books.book_id = list_books.book_id WHERE list_books.list_id = '$id'";
    }

    return getBookListFromQuery($sql);
}

function getBookListFromQuery($sql)
{
    global $conn;
    $result = $conn->query($sql);
    $bookList = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $book = array(
                "id" => $row["book_id"],
                "title" => $row["title"],
                "author" => $row["author"],
                "genre" => $row["genre"],
                "date_add" => $row["date_added"],
                "description" => $row["book_description"],
                "image" => $row["link_image"],
                "rate" => ($row["rating"] == null) ? 0 : $row["rating"]
            );
            $bookList[] = $book;
        }
    }

    return $bookList;
}

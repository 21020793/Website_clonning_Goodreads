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
    $limit = $_POST["limit"];

    if ($type == "book") {
        $book = getBookById($id);
        echo json_encode($book);
    } else if ($type == "list") {
        $bookList = getBookListById($id);
        echo json_encode($bookList);
    } else if ($type == "search") {
        $bookList = getBookListByName($id);
        echo json_encode($bookList);
    } else if ($type == "genre") {
        $genre = getBookListByGenre($id);
        echo json_encode($genre);
    } else if ($type == "allgenre") {
        $genre = getAllGenre();
        echo json_encode($genre);
    } else {
        $userBookListId = getUserBookList();
        $userBookList = getBookListById($userBookListId);
        echo json_encode($userBookList);
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
    global $limit;
    $id = $conn->real_escape_string($id);

    if ($id == "Featured") {
        $sql = "SELECT * FROM books ORDER BY rating DESC LIMIT $limit";
    } else if ($id == "New") {
        $sql = "SELECT * FROM books ORDER BY date_added DESC LIMIT $limit";
    } else {
        $sql = "SELECT * FROM books INNER JOIN list_books ON books.book_id = list_books.book_id WHERE list_books.list_id = '$id'";
    }

    return getBookListFromQuery($sql);
}

function getUserBookList()
{
    global $conn;
    $user_id = $_POST["id"];
    $sql = "SELECT reading_lists.list_id FROM reading_lists WHERE reading_lists.account_id = '$user_id'";
    $result = $conn->query($sql);
    if ($result->num_rows == 1) {
        while ($row = $result->fetch_assoc()) {
            $bookList = $row["list_id"];
        }
    }

    return $bookList;
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

function getBookListByName($name)
{
    global $conn;
    $name = $conn->real_escape_string($name);
    $sql = "SELECT * FROM books WHERE title LIKE '%$name%'";
    return getBookListFromQuery($sql);
}

function getBookListByGenre($genre)
{
    global $conn;
    $genre = $conn->real_escape_string($genre);
    $sql = "SELECT * FROM books WHERE genre = '$genre'";
    return getBookListFromQuery($sql);
}

function getAllGenre()
{
    global $conn;
    $sql = "SELECT genre, COUNT(*) as book_count FROM books GROUP BY genre ORDER BY book_count DESC";
    $result = $conn->query($sql);
    $genreList = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $genreList[] = $row["genre"];
        }
    }

    return $genreList;
}


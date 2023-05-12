<?php
// Bắt đầu phiên
session_start();

// Bao gồm tệp connectdatabase.php để có kết nối cơ sở dữ liệu
require 'connectdatabase.php';

// Xử lý yêu cầu POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Lấy giá trị id từ yêu cầu POST
    $id = $_POST["id"];
    if ($id == "Featured") {
        $sql = "SELECT * FROM books ORDER BY rating DESC LIMIT 10";
    } else {
        $sql = "SELECT * FROM books INNER JOIN list_books ON books.book_id = list_books.book_id WHERE list_books.list_id = '$id'";
    }

    // Truy vấn cơ sở dữ liệu để lấy danh sách sách

    $result = $conn->query($sql);

    // Tạo một mảng để lưu trữ danh sách sách
    $bookList = array();

    if ($result->num_rows > 0) {
        // Lặp qua các hàng kết quả và thêm sách vào mảng
        while ($row = $result->fetch_assoc()) {
            $book = array(
                "title" => $row["title"],
                "imageUrl" => "pics\image.jpg",
                "Date" => "2019-12-12",
                "rate" => ($row["rating"] == null) ? 0 : $row["rating"]
            );
            $bookList[] = $book;
        }
    }

    // Đặt header là JSON
    header('Content-Type: application/json');

    // Trả về danh sách sách dưới dạng JSON
    echo json_encode($bookList);
}

$conn->close();

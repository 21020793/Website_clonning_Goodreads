<?php
// Bắt đầu phiên
session_start();

// Bao gồm tệp connectdatabase.php để có kết nối cơ sở dữ liệu
require 'connectdatabase.php';

// Xử lý yêu cầu POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $bookId = $_POST['book_id'];
    $accountId = $_POST['account_id'];

    // Thực hiện câu lệnh SQL SELECT để kiểm tra sự tồn tại của sách trong danh sách của người dùng
    $stmt = $conn->prepare("SELECT * FROM List_Books WHERE list_id IN (SELECT list_id FROM Reading_Lists WHERE account_id = ?) AND book_id = ?");
    $stmt->bind_param("ii", $accountId, $bookId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Sách đã có trong danh sách người dùng
        echo "exists";
    } else {
        $list_id = getListId($conn, $accountId);
        // Tiến hành thêm book_id và list_id vào bảng List_Books
        $stmt = $conn->prepare("INSERT INTO List_Books (list_id, book_id) VALUES (?, ?)");
        $stmt->bind_param("ii", $list_id, $bookId);
        $stmt->execute();
        echo "success";
    }
}

// Đóng kết nối cơ sở dữ liệu
$conn->close();

function getListId($conn, $account_id)
{
    $stmt = $conn->prepare("SELECT list_id FROM Reading_Lists WHERE account_id = ?");
    $stmt->bind_param("i", $account_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $list_id = $row['list_id'];
        return $list_id;
    } else {
        return null;
    }

    $stmt->close();
}

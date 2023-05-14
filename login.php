<?php
// Bắt đầu phiên
session_start();

// Bao gồm tệp connectdatabase.php để có kết nối cơ sở dữ liệu
require 'connectdatabase.php';

// Xử lý khi người dùng gửi form đăng nhập
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Lấy thông tin đăng nhập
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Kiểm tra thông tin trong cơ sở dữ liệu
    $sql = "SELECT * FROM accounts WHERE username = '$username' AND password = '$password'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        // Đăng nhập thành công
        $row = $result->fetch_assoc();
        $_SESSION["username"] = $row["username"];
        $_SESSION["id"] = $row['account_id'];
        echo $_SESSION["id"];
    } else {
        // Đăng nhập không thành công
        echo "fail";
    }
}

$conn->close();

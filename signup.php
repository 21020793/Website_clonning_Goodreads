<?php
// Bao gồm tệp connectdatabase.php để có kết nối cơ sở dữ liệu
require 'connectdatabase.php';

// Xử lý khi người dùng gửi form đăng kí tài khoản
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Lấy thông tin đăng nhập
    $username = $_POST["username"];
    $password = $_POST["password"];
    $email = $_POST["email"];

    // Kiểm tra xem tài khoản đã tồn tại chưa
    $stmt = $conn->prepare("SELECT * FROM accounts WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Tài khoản đã tồn tại
        echo "failed";
        return;
    }

    // Tạo id mới
    $stmt = $conn->prepare("INSERT INTO accounts (username, password, email) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $username, $password, $email);

    if ($stmt->execute()) {
        // Đăng kí tài khoản thành công
        $account_id = $stmt->insert_id; // Lấy giá trị ID của bản ghi vừa chèn
        echo "success";
    } else {
        // Đăng kí tài khoản không thành công
        echo "failed";
    }

    $stmt->close();
}

$conn->close();

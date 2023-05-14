<?php

// Kết nối tới cơ sở dữ liệu (sử dụng MySQLi)
$server_name = "localhost";
$username = "root";
$password = "";
$dbname = "DataManagement";

$conn = new mysqli($server_name, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

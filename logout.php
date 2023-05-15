<?php
// Bắt đầu phiên
session_start();

// Xóa tất cả các biến phiên
$_SESSION = array();

// Hủy phiên làm việc
session_destroy();

// Chuyển hướng đến trang đăng nhập
// header("Location: index.php");
exit();

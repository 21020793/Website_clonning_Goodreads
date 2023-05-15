// Xóa dữ liệu trong localStorage
localStorage.clear();

// Gửi yêu cầu đến logout.php bằng AJAX
var xhr = new XMLHttpRequest();
xhr.open("GET", "logout.php", true);
xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
        // Xử lý phản hồi từ logout.php
        var response = xhr.responseText;
        console.log(response);
        // Chuyển hướng đến trang đăng nhập
        window.location.href = "index.html";
    }
};
xhr.send();

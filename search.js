document.getElementById("searchForm").addEventListener("submit", function (event) {
    event.preventDefault(); // Ngăn chặn việc gửi form mặc định
    var searchValue = document.getElementsByClassName("searchbar_input")[0].value;
    var url = "search_result.html?search=" + encodeURIComponent(searchValue);
    window.location.href = url; // Chuyển hướng tới trang search_result.html với giá trị đưa vào
});

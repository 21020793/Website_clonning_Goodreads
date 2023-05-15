// Tạo phần tử <ul>
var ulElement = document.createElement("ul");

// Tạo mảng chứa các đường dẫn và nội dung của các mục li
var navItems = [];
if (localStorage.getItem("id")) {
    navItems = [
        { href: "index.html", text: "Home" },
        { href: "genres.html", text: "Genres" },
        // { href: "adding_book.html", text: "Add Book" },
        { href: "Book_shelf.html", text: localStorage.getItem("username") + "'s Books" },
        { href: "logout.html", text: "Log Out" }
    ];
} else {
    navItems = [
        { href: "index.html", text: "Home" },
        { href: "genres.html", text: "Genres" },
        { href: "login.html", text: "Log In" }
    ];
}

// Tạo các mục li và thêm vào phần tử <ul>
navItems.forEach(item => {
    var liElement = document.createElement("li");
    liElement.classList.add("nav_bar");

    var aElement = document.createElement("a");
    aElement.href = item.href;
    aElement.textContent = item.text;

    liElement.appendChild(aElement);
    ulElement.appendChild(liElement);
});

// Tìm phần tử cha trong HTML để thêm phần tử <ul>
var parentElement = document.querySelector("ul");
parentElement.appendChild(ulElement);
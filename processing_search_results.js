const urlParams = new URLSearchParams(window.location.search);
const text_search = urlParams.get('search');

document.addEventListener("DOMContentLoaded", async () => {
    try {
        const answer = document.querySelector(".feat_row");
        const bookList = await getBookList(text_search, "search");

        if (bookList.length > 0) {
            bookList.forEach(element => {
                answer.appendChild(element);
            });
            // Tạo phần tử <p>
            var paragraph = document.createElement("p");
            paragraph.textContent = "Search Result:";

            // Tạo phần tử <div> với class "box"
            var box = document.createElement("div");
            box.classList.add("box");
            box.appendChild(paragraph);

            // Tìm phần tử cha trong HTML với class "result"
            var resultElement = document.querySelector(".result");

            // Thêm phần tử "box" vào phần tử cha "result"
            resultElement.appendChild(box);
        } else {
            var resultElement = document.querySelector(".result");

            // Xóa bỏ các phần tử con trong phần tử "result"
            resultElement.innerHTML = "";

            // Tạo phần tử thông báo
            var notification = document.createElement("p");
            notification.textContent = "No books found.";

            // Thêm phần tử thông báo vào phần tử "result"
            resultElement.appendChild(notification);
        }
    } catch (error) {
        console.log(error);
    }
});
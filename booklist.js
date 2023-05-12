function createBookElements(book) {
    // Tạo phần tử div chứa thông tin sách
    const bookElement = document.createElement("div");
    bookElement.classList.add("featured_img");

    // Tạo phần tử hình ảnh
    const imageElement = document.createElement("img");
    imageElement.src = book.imageUrl;

    // Tạo phần tử tiêu đề sách
    const titleElement = document.createElement("h4");
    titleElement.textContent = book.title;

    // Tạo phần tử đánh giá
    const ratingElement = document.createElement("div");
    ratingElement.classList.add("rating");

    // Tạo các phần tử sao cho đánh giá
    for (let i = 0; i < book.rate - 0.5; i++) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star");
        ratingElement.appendChild(starElement);
    }
    if (book.rate % 1 !== 0) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star-half-o");
        ratingElement.appendChild(starElement);
    }
    for (let i = 0; i < 4.5 - book.rate; i++) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star-o");
        ratingElement.appendChild(starElement);
    }

    // Thêm phần tử hình ảnh, tiêu đề và đánh giá vào phần tử sách
    bookElement.appendChild(imageElement);
    bookElement.appendChild(titleElement);
    bookElement.appendChild(ratingElement);

    return bookElement;
}

document.addEventListener("DOMContentLoaded", async () => {
    try {
        const bookContainerList = document.querySelectorAll(".feat_row");
        const featured = bookContainerList[0];
        const newlyReleased = bookContainerList[1];

        const featuredBookList = await getBookList("Featured");
        const newlyReleasedBookList = await getBookList("4");

        featuredBookList.forEach((bookElement) => {
            featured.appendChild(bookElement);
        });

        newlyReleasedBookList.forEach((bookElement) => {
            newlyReleased.appendChild(bookElement);
        });
    } catch (error) {
        console.error(error);
    }
});

async function getBookList(id) {
    const url = 'booklist.php';
    const params = 'id=' + id;

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: params,
        });

        if (!response.ok) {
            throw new Error('Failed to fetch book list');
        }

        const bookList = await response.json();
        const bookElements = [];

        bookList.forEach((book, index) => {
            if (index > 9) return;
            const bookElement = createBookElements(book);
            bookElements.push(bookElement);
        });

        return bookElements;
    } catch (error) {
        throw new Error('Failed to fetch book list');
    }
}

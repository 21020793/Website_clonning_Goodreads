function createBookElements(book) {
    // Tạo phần tử div chứa thông tin sách
    const bookElement = document.createElement("div");
    bookElement.classList.add("featured_img");

    // Tạo phần tử hình ảnh
    const imageElement = document.createElement("img");
    imageElement.src = book.image;

    // Tạo phần tử tiêu đề sách
    const titleElement = document.createElement("h4");
    titleElement.textContent = book.title;

    // Tạo phần tử đánh giá
    const ratingElement = document.createElement("div");
    ratingElement.classList.add("rating");

    // Tạo các phần tử sao cho đánh giá
    var temp = Math.round(book.rate * 2) / 2;
    for (let i = 0; i < Math.floor(temp); i++) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star");
        ratingElement.appendChild(starElement);
    }
    if (temp % 1 !== 0) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star-half-o");
        ratingElement.appendChild(starElement);
    }
    for (let i = 0; i < 5 - Math.ceil(temp); i++) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star-o");
        ratingElement.appendChild(starElement);
    }

    // Thêm phần tử hình ảnh, tiêu đề và đánh giá vào phần tử sách
    bookElement.appendChild(imageElement);
    bookElement.appendChild(titleElement);
    bookElement.appendChild(ratingElement);

    // thêm sự kiện click vào phần tử sách
    bookElement.setAttribute('data-book-id', book.id);

    bookElement.addEventListener('click', function () {
        const bookId = this.getAttribute('data-book-id');
        const urlParams = new URLSearchParams(window.location.search);
        urlParams.set('book_id', bookId);
        const newUrl = `${window.location.origin}/book_info.html?${urlParams.toString()}`;
        window.location.href = newUrl;
    });


    return bookElement;
}

async function getBookList(id, type = 'list', limit = 10) {
    const url = 'getBooks.php';
    const params = 'id=' + id + '&type=' + type + '&limit=' + limit;

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
            if (index > limit - 1) return;
            const bookElement = createBookElements(book);
            bookElements.push(bookElement);
        });

        return bookElements;
    } catch (error) {
        throw new Error('Failed to fetch book list');
    }
}

async function getUserBookList() {
    const url = 'getBooks.php';
    const params = 'id=' + localStorage.getItem("id") + '&type=user&limit=100';
    console.log(params);

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
            // if (index > 4) return;
            const bookElement = createBookElements(book);
            bookElements.push(bookElement);
        });

        return bookElements;
    } catch (error) {
        throw new Error('Failed to fetch book list');
    }
}

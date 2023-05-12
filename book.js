async function getBookDetails(id) {
    const url = 'getBooks.php';
    const params = 'id=' + id + '&type=book';

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: params,
        });

        if (!response.ok) {
            throw new Error('Failed to fetch book details');
        }

        const book = await response.json();
        return book;
    } catch (error) {
        throw new Error('Failed to fetch book details');
    }
}
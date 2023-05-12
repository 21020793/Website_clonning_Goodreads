CREATE DATABASE IF NOT EXISTS DataManagement;
USE DataManagement;
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    rating FLOAT,
    date_added DATE DEFAULT CURRENT_DATE,
    publication_date DATE
);
CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    account_id INT,
    review_text TEXT,
    rating INT,
    review_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
CREATE TABLE Reading_Lists (
    list_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    list_name VARCHAR(255) NOT NULL,
    date_created DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
CREATE TABLE List_Books (
    list_id INT,
    book_id INT,
    FOREIGN KEY (list_id) REFERENCES Reading_Lists(list_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
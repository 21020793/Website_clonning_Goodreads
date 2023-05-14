<?php
function updateRating($bookId)
{
    global $conn;

    // Lấy tổng số lượt đánh giá và tổng điểm đánh giá của sách
    $stmt = $conn->prepare("SELECT COUNT(*) as total_reviews, SUM(rating) as total_rating FROM Reviews WHERE book_id = ? AND parent_comment_id IS NULL");
    $stmt->bind_param("i", $bookId);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    $total_reviews = $row["total_reviews"];
    $total_rating = $row["total_rating"];

    // Tính toán lại đánh giá trung bình
    $average_rating = ($total_reviews > 0) ? ($total_rating / $total_reviews) : 0;

    // Cập nhật đánh giá trung bình trong bảng Books
    $stmt = $conn->prepare("UPDATE Books SET rating = ? WHERE book_id = ?");
    $stmt->bind_param("di", $average_rating, $bookId);
    $stmt->execute();

    // trả về đánh giá trung bình
    return $average_rating;
}

function getBookId()
{
    global $conn;
    $review_id = $_POST["review_id"];
    $stmt = $conn->prepare("SELECT book_id FROM reviews WHERE review_id = ?");
    $stmt->bind_param("i", $review_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    return $row["book_id"];
}

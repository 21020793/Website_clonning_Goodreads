<?php
// Bắt đầu phiên
session_start();

// Bao gồm tệp connectdatabase.php để có kết nối cơ sở dữ liệu
require '../connectdatabase.php';

// Xử lý khi người dùng gửi yêu cầu xóa review
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Lấy thông tin review
    $review_id = $_POST["review_id"];
    $account_id = $_SESSION["id"];
    $content = $_POST["content"];
    $rating = $_POST["rating"];
    $book_id = getBookId();

    // Bắt đầu transaction
    $conn->begin_transaction();

    try {
        // Kiểm tra xem người dùng có phải là tác giả của review không
        $stmt = $conn->prepare("SELECT * FROM reviews WHERE review_id = ? AND account_id = ?");
        $stmt->bind_param("ii", $review_id, $account_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows == 1) {
            // Cập nhật nội dung và đánh giá của review
            $stmt = $conn->prepare("UPDATE reviews SET review_text = ?, rating = ? WHERE review_id = ?");
            $stmt->bind_param("sii", $content, $rating, $review_id);
            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                // Cập nhật review thành công, commit transaction
                updateRating($book_id);
                $conn->commit();
                echo "success";
            } else {
                // Cập nhật review không thành công, rollback transaction
                $conn->rollback();
                echo "fail";
            }
        } else {
            // Người dùng không phải là tác giả của review
            echo "not_author";
        }
    } catch (Exception $e) {
        // Xảy ra lỗi, rollback transaction
        $conn->rollback();
        echo "fail";
    }
}

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

$conn->close();

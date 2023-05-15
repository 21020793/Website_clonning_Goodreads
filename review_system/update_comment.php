<?php
// Bắt đầu phiên
session_start();

// Bao gồm tệp connectdatabase.php để có kết nối cơ sở dữ liệu
require '../connectdatabase.php';

include 'update_rating.php';

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
                $average_rating = updateRating($book_id);
                $conn->commit();
                echo json_encode(["status" => "success", "average_rating" => $average_rating]);
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

$conn->close();

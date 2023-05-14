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

    // Bắt đầu transaction
    $conn->begin_transaction();

    try {
        // Kiểm tra xem người dùng có phải là tác giả của review không
        $stmt = $conn->prepare("SELECT * FROM reviews WHERE review_id = ? AND account_id = ?");
        $stmt->bind_param("ii", $review_id, $account_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows == 1) {
            // Xóa reply của review
            $stmt = $conn->prepare("DELETE FROM reviews WHERE parent_comment_id = ?");
            $stmt->bind_param("i", $review_id);
            $stmt->execute();

            // Xóa review
            $stmt = $conn->prepare("DELETE FROM reviews WHERE review_id = ?");
            $stmt->bind_param("i", $review_id);
            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                // Xóa review thành công, commit transaction
                $conn->commit();
                echo "success";
            } else {
                // Xóa review không thành công, rollback transaction
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

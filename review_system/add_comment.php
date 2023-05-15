<?php
// Bắt đầu phiên
session_start();

// Bao gồm tệp connectdatabase.php để có kết nối cơ sở dữ liệu
require '../connectdatabase.php';

include 'update_rating.php';

// Xử lý khi người dùng gửi comment
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // lấy giá trị từ yêu cầu POST
    $type = $_POST["type"];
    $book_id = $_POST["book_id"];
    $account_id = $_SESSION["id"];
    $content = $_POST["content"];
    if ($type == "comment") {
        $rating = null;
        $parent_comment_id = $_POST["parent_comment_id"];
    } else if ($type == "review") {
        $rating = $_POST["rating"];
        $parent_comment_id = null;
    } else {
        // Trả về fail và thoát không xử lý
        echo json_encode(["status" => "fail"]);
        exit();
    }

    // Bắt đầu transaction
    $conn->begin_transaction();

    try {
        // Chuẩn bị câu lệnh INSERT
        $stmt = $conn->prepare("INSERT INTO reviews (book_id, account_id, review_text, rating, parent_comment_id) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("iisii", $book_id, $account_id, $content, $rating, $parent_comment_id);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            // Thêm comment hoặc review thành công, commit transaction
            $average_rating = updateRating($book_id);
            $conn->commit();
            echo json_encode(["status" => "success", "average_rating" => $average_rating]);
        } else {
            // Thêm comment hoặc review không thành công, rollback transaction
            $conn->rollback();
            echo json_encode(["status" => "fail"]);
        }
    } catch (Exception $e) {
        // Xảy ra lỗi, rollback transaction
        $conn->rollback();
        echo json_encode(["status" => "fail"]);
    }
}





$conn->close();

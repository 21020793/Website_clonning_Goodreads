<?php
// Bắt đầu phiên
session_start();

// Bao gồm tệp connectdatabase.php để có kết nối cơ sở dữ liệu
require '../connectdatabase.php';

// Xử lý khi người dùng gửi comment
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $type = $_POST["type"];
    $id = $_POST["id"];
    $commentLimit = $_POST["comment_limit"]; // Số lượng comment nhất định

    if ($type == "book") {
        // Lấy thông tin review của sách xắp xếp theo ngày thêm thứ tự gần -> xa
        $stmt = $conn->prepare("SELECT r.*, a.username FROM reviews AS r JOIN accounts AS a ON r.account_id = a.account_id WHERE r.book_id = ? ORDER BY r.review_time DESC LIMIT ?");
    } else if ($type == "review") {
        // Lấy thông tin comment của review
        $stmt = $conn->prepare("SELECT r.*, a.username FROM reviews AS r JOIN accounts AS a ON r.account_id = a.account_id WHERE r.parent_comment_id = ? ORDER BY r.review_time ASC LIMIT ?");
    } else if ($type == "review_user") {
        // Lấy thông tin review của user cho quyển sách
        $account_id = $_POST["account_id"];
        $stmt = $conn->prepare("SELECT r.*, a.username FROM reviews AS r JOIN accounts AS a ON r.account_id = a.account_id WHERE r.account_id = '$account_id' AND r.book_id = ? LIMIT ?");
    } else {
        // Trả về fail và thoát không xử lý
        echo "fail";
        exit();
    }


    // Liên kết tham số và thực thi câu lệnh
    $stmt->bind_param("ii", $id, $commentLimit);
    $stmt->execute();
    $result = $stmt->get_result();

    // Tạo một mảng chứa kết quả
    $data = array();
    $vvv = array();

    // Lặp qua các dòng kết quả và thêm vào mảng
    while ($row = $result->fetch_assoc()) {
        $temp = array(
            "parent" => $row["parent_comment_id"] == null ? 0 : $row["parent_comment_id"],
            "id" => $row["review_id"],
            "content" => $row["review_text"],
            "createdAt" => $row["review_time"],
            "score" => $row["rating"] == null ? 0 : $row["rating"],
            "user" => array(
                "image" =>  "./images/avatars/image-amyrobson.webp",
                "username" => $row["username"],
            ),
            "replies" => [],
        );

        if($temp["parent"] == 0) {
            $data[] = $temp;
        } else {
            $vvv[] = $temp;
        }
    }

    foreach ($vvv as $item) {
        $parentIndex = findParentIndex($data, $item["parent"]);
        if ($parentIndex !== false) {
            $data[$parentIndex]["replies"][] = $item;
        }
    }

    // Trả về kết quả dưới dạng JSON
    if ($type == "review_user") {
        count($data) > 0 ? $data = $data[0] : $data = null;
    }
    echo json_encode($data);
}

function findParentIndex($data, $parentId)
{
    foreach ($data as $index => $item) {
        if ($item["id"] == $parentId) {
            return $index;
        }
    }
    return false;
}

// Đóng kết nối
$conn->close();

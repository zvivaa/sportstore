<?php
require_once 'db_connect.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

try {
    if (isset($_GET['category_id'])) {
        $category_id = $_GET['category_id'];
        // Теперь здесь можно обрабатывать запросы с 'category_id'
    } else {
        // Здесь можно обрабатывать запросы без 'category_id'
    }
    $min_price = isset($_GET['min_price']) ? (int)$_GET['min_price'] : 0;
    $max_price = isset($_GET['max_price']) ? (int)$_GET['max_price'] : PHP_INT_MAX;

    $sql = "SELECT * FROM products WHERE category_id = ? AND price BETWEEN ? AND ?";
    $stmt = $conn->prepare($sql);
    if(!$stmt){
        throw new Exception("Ошибка при подготовке запроса: " . $conn->error);
    }
    $stmt->bind_param("iii", $category_id, $min_price, $max_price);
    $stmt->execute();
    $result = $stmt->get_result();

    $products = array();
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }

    echo json_encode($products);

    $stmt->close();
    $conn->close();
} catch(Exception $e) {
    // Это отправит информацию об ошибке в JSON формате
    echo json_encode(array("error" => $e->getMessage()));
}
?>

<?php
require_once 'db_connect.php';

$sql = "SELECT * FROM products ORDER BY id DESC LIMIT 5";
$result = $conn->query($sql);

$products = array();
while ($row = $result->fetch_assoc()) {
    $products[] = $row;
}

echo json_encode($products);

$conn->close();
?>

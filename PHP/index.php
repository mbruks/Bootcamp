<?php
// Создаем соединение
$db = new PDO('mysql:host=localhost;dbname=products', 'root', '');
// Проверяем соединение
if (!$db) {
    die("Connection failed: " . mysqli_connect_error());
}
if (!empty($_GET)) {
    if (isset($_GET['cat_id']))
        include 'category_product.php';
    elseif (isset($_GET['id']))
        include 'product.php';
    else {
        include("Location: error_404.php");
        exit;
    }
} else {
    include 'category.php';
}

<?php
# Обновляем название header
$title = "Категории товаров";

//Запрос, возвращающий категории с количеством товаров внутри
$request = "SELECT category.id_category, category.title, count(category_product.id_product) as count_product
            FROM category 
            JOIN category_product ON category.id_category = category_product.id_category
            JOIN product ON product.id_product = category_product.id_product
            WHERE product.count_products = 1
            GROUP BY category.id_category
            ORDER BY count_product DESC";

$query = $db->prepare($request);
$query->execute();
$categories = $query->fetchAll();

?>

<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <title>Интернет магазин одежды</title>
    <link rel="stylesheet" href="/css/category.css">
    <link rel="stylesheet" href="/css/main.css">
</head>

<body>
    <div class="layout">
        <!--p>Подключаем заголовок</p-->
        <?php require_once "header.php" ?>
        <div class="categories">
            <?php foreach ($categories as $category) : ?>
                <div class="card">
                    <a href="index.php?cat_id=<?= $category['id_category'] ?>&count=<?= $category['count_product'] ?>&page=0">
                        <div class="content__title">
                            <div><?= $category['title'] ?></div>
                        </div>
                        <div class="content__count">
                            Количество товаров: <?= $category['count_product'] ?>
                        </div>
                    </a>
                </div>
            <?php endforeach ?>
        </div>
        <?php require_once "footer.php" ?>
    </div>
</body>
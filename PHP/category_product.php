<?php

# Обновляем путь
$path = "";
# id категории
$id = (int) $_GET['cat_id'];
# Количество товаров в категории
$count_product = (int) $_GET['count'];
# Текущая страница
$page = (int) $_GET['page'];
# Лимит на количество товаров на странице
$count = 12;
# Число страниц
$count_pages = ceil($count_product / $count);
# С какого товара показываем
$offset = $page * $count;

# Запрос, возвращающий 12 товаров заданной категории
$request = "SELECT product.id_product, product.title, category.title AS category, image.url, image.alt
                FROM product 
                JOIN category_product ON category_product.id_product = product.id_product
                JOIN category ON category.id_category = product.category
                JOIN image ON image.id_image = product.image
                WHERE category_product.id_category = $id AND product.count_products = 1
                LIMIT $count offset $offset";
$query = $db->prepare($request);
$query->execute();
$products = $query->fetchAll();

# Запрос, возвращающий информацию о категории
$request = "SELECT title, description from category where id_category=$id";
$query = $db->prepare($request);
$query->execute();
$category = $query->fetch();

# Если категория пустая
if (empty($products))
    header("Location: error_404.php");

# Обновляем название header
$title = $category['title'];

?>

<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <title><?= $category['title'] ?></title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/category_product.css">
</head>

<body>
    <div class="layout">
        <?php require_once "header.php" ?>
        <div class="category__description"><?= $category['description'] ?></div>
        <div class="category__products">
            <?php foreach ($products as $product) : ?>
                <div class="card">
                    <a href="index.php?id=<?= $product['id_product'] ?>">
                        <div class="content__image"><img src="<?= $product['url'] ?>" alt="<?= $product['alt'] ?>"></div>
                        <div class="content__title"><?= $product['title'] ?></div>
                    </a>
                </div>
            <?php endforeach ?>
        </div>
        <div class="pages">
            <?php
            for ($i = 0; $i < $count_pages; $i++) {
                echo "<a href=\"index.php?cat_id=$id&count=$count_product&page=$i\"";
                if ($page == $i)
                    echo "class=\"pages__current\"";
                echo ">", $i + 1, "</a>";
            }
            ?>
        </div>
        <?php require_once "footer.php" ?>
    </div>
</body>
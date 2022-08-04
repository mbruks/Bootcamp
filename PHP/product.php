<?php
#Обновляем путь
$path = strstr($_SERVER['HTTP_REFERER'], "?");
# id товара
$id_product = (int) $_GET['id'];

# Запрос, возвращающий информацию о товаре
$request = "SELECT title, price, price_without_discount, price_with_promocode, description
    FROM product 
    WHERE id_product = $id_product";

$query = $db->prepare($request);
$query->execute();
$product = $query->fetch();

# Если товар не найден
if (empty($product))
    header("Location: error_404.php");

# Запрос, возвращающий второстепенные фото для товара
$request = "SELECT url, alt
                FROM image
                JOIN image_product ON image.id_image = image_product.id_image
                JOIN product ON product.id_product = image_product.id_product
                WHERE image_product.id_product = $id_product and product.image != image.id_image";
$query = $db->prepare($request);
$query->execute();
$images = $query->fetchAll();

# Запрос, возвращающий главное фото для товара
$request = "SELECT url, alt
                FROM image
                JOIN product ON image.id_image = product.image
                WHERE product.id_product = $id_product";
$query = $db->prepare($request);
$query->execute();
$main_image = $query->fetch();

# Запрос, возвращающий категории товара
$request = "SELECT title
                FROM category 
                JOIN category_product ON category.id_category = category_product.id_category
                WHERE category_product.id_product = $id_product";
$query = $db->prepare($request);
$query->execute();
$categories = $query->fetchAll();
# Обновляем название header
$title = $product['title'];

?>


<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/product.css">
    <link href="Toast/jquery.toast.min.css" rel="stylesheet" type="text/css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js">
    </script>
    <script type="text/javascript" src="Jquery/jquery-3.6.0.min.js"></script>
    <script src="Toast/jquery.toast.min.js"></script>

</head>

<body>
    <div class="layout">
        <?php require_once "header.php" ?>
        <div class="product">
            <div class="product__view">
                <div class="product__view-left">
                    <?php foreach ($images as $image) : ?>
                        <div class="product__view-item">
                            <img src="<?= $image['url'] ?>" alt="<?= $image['alt'] ?>">
                        </div>
                    <?php endforeach ?>
                </div>
                <div class="product__view-main" title="<?php echo $main_image['alt']; ?>" style="background-image: url(<?= $main_image['url'] ?>)"></div>
            </div>
            <div class="product__description">
                <h1 class="product__title"><?= $product['title'] ?></h1>
                <div class="product__tag">
                    <?php foreach ($categories as $category) : ?>
                        <p><?= $category['title'] ?></p>
                    <?php endforeach ?>
                </div>
                <div class="product__price">
                    <div class="product__price-actual">
                        <span class="product__actual-old"><?php echo $product['price_without_discount']; ?></span>
                        <span class="product__actual-current rub"><?php echo $product['price']; ?></span>
                    </div>
                    <div class="product__price-discond">
                        <?php
                        if ($product['price_with_promocode']) {
                            echo '<span class="product__discond-value rub">', $product['price_with_promocode'], '</span>';
                            echo '<span class="product__discond-text">- с промокодом</span>';
                        }

                        ?>
                    </div>

                </div>
                <div class="product__info">
                    <div class="product__info-item">
                        <ion-icon name="checkmark-outline"></ion-icon>
                        В наличии в магазине
                        <a href="index.php">Lamoda</a>
                    </div>
                    <div class="product__info-item">
                        <ion-icon name="car-outline"></ion-icon>
                        Бесплатная доставка
                    </div>
                </div>
                <div class="product__counter">
                    <span class="product__counter-text">Количество товара:</span>
                    <div class="product__counter-item">
                        <div class="minus">
                            <ion-icon name="remove-outline"></ion-icon>
                        </div>
                        <input class='product__counter-value' type="number" value="1" step="1" min="1" max="100">
                        <div class="plus">
                            <ion-icon name="add-outline"></ion-icon>
                        </div>
                    </div>

                </div>
                <div class="product__actions">
                    <button class="product__button button-blue">Купить</button>
                    <button class="product__button">В избранное</button>
                </div>
                <div class="product__text">
                    <p>
                        <?php echo $product['description']; ?>
                    </p>
                </div>
                <div class="product__share">
                    <span class="product__share-text">Поделиться:</span>
                    <a href="#">
                        <ion-icon name="logo-vk"></ion-icon>
                    </a>
                    <a href="#">
                        <ion-icon name="logo-facebook"></ion-icon>
                    </a>
                    <a href="#">
                        <ion-icon name="logo-twitter"></ion-icon>
                    </a>
                    <a href="#">
                        <ion-icon name="logo-tiktok"></ion-icon>
                    </a>
                    <a href="#">
                        <div class="product__share-nameplate">
                            123
                        </div>
                    </a>

                </div>
            </div>
        </div>
        <?php require_once "footer.php" ?>
    </div>
    <script type="text/javascript" src="main.js"></script>
</body>

</html>
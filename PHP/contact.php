<?php
#Обновляем путь
$path = strstr($_SERVER['HTTP_REFERER'], "?");

$title = "Обратная связь";
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><?php $title ?></title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/contact.css">
</head>

<body>
    <div class="layout">
        <?php require_once "header.php" ?>
        <div class="alert__success"><?= $_SESSION['success'] ?></div>
        <form action="check_contact.php" method="post">
            <label>Имя:</label><br>
            <input type="text" name="username" placeholder="Введите имя" value="<?= $_SESSION['username'] ?>" required>
            <div class="text-danger"><?= $_SESSION['error_username'] ?></div>
            <br>
            <label>Электронная почта:</label><br>
            <input type="email" name="email" placeholder="Введите email" value="<?= $_SESSION['email'] ?>" required>
            <div class="text-danger"><?= $_SESSION['error_email'] ?></div>
            <br>
            <label for="date">Дата рождения: </label><br>
            <input type="date" name="date" value="<?= $_SESSION['date'] ?>" required>
            <div class="text-danger"><?= $_SESSION['error_date'] ?></div>
            <br>
            <label>Пол:</label><br>
            <label><input type="radio" required name="gender" value="М">М</label>
            <label><input type="radio" name="gender" value="Ж">Ж</label>
            <br>
            <br>
            <label>Тема сообщения:</label><br>
            <input type="text" name="subject" placeholder="Тема сообщения" value="<?= $_SESSION['subject'] ?>" required><br>
            <div class="text-danger"><?= $_SESSION['error_subject'] ?></div>
            <label>Cообщениe:</label><br>
            <textarea cols="30" rows="5" type="text" name="message" placeholder="Ваше сообщение" required>
                <?= $_SESSION['message'] ?>
            </textarea>
            <div class="text-danger"><?= $_SESSION['error_message'] ?></div>
            <br>
            <label><input type="checkbox" required name="Rules">С правилами ознакомился и согласен</label><br>
            <br>
            <button name="Send">Отправить</button>
            <br>
            <br>
        </form>

    </div>

</body>

</html>
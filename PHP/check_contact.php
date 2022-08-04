<?php
session_start();

# Очистка
unset($_SESSION['username']);
unset($_SESSION['email']);
unset($_SESSION['date']);
unset($_SESSION['gender']);
unset($_SESSION['subject']);
unset($_SESSION['message']);

unset($_SESSION['error_username']);
unset($_SESSION['error_email']);
unset($_SESSION['error_date']);
unset($_SESSION['error_subject']);
unset($_SESSION['error_message']);

unset($_SESSION['success']);
# Переадресация
function redirect()
{
    header('Location: contact.php');
    exit;
}

# Получаем данные с формы
$username = trim($_POST['username']);
$from = trim($_POST['email']);
$date = trim($_POST['date']);
$gender = trim($_POST['gender']);
$subject = trim($_POST['subject']);
$message = trim($_POST['message']);

# Сохраним данные
$_SESSION['username'] = $username;
$_SESSION['email'] = $from;
$_SESSION['date'] = $date;
$_SESSION['gender'] = $gender;
$_SESSION['subject'] = $subject;
$_SESSION['message'] = $message;

$error = false;

# Выполняем проверку данных
if (strlen($username) <= 4) {
    $_SESSION['error_username'] = "Введите корректное имя от 4 символов";
    $error = true;
}
if (strpbrk($userName, '|[]{}№;:~`<>+=$#!?,/\'"()&*^%\'')) {
    $_SESSION['error_username'] = $_SESSION['error_username'] + "\nИмя не должно содержать |[]{}№;:~`<>+=$#!?,/\'\"()&*^%";
    $error = true;
}
if (strlen($from) < 5 || strpos($from, "@") == false) {
    $_SESSION['error_email'] = "Вы ввели некорректный email";
    $error = true;
}
if ((int)substr($_SESSION['date'], 0, 4) > (int)substr(date('/Y'), 1, 4)) {
    $_SESSION['error_date'] = "Некорректная дата рождения";
    $error = true;
}
if (strlen($subject) <= 5) {
    $_SESSION['error_subject'] = "Тема сообщения не менее 5 символов";
    $error = true;
}
if (strlen($message) <= 15) {
    $_SESSION['error_message'] = "Сообщение не менее 15 символов";
    $error = true;
}

if ($error == false) {
    $_SESSION['success'] = "Сообщение успешно сохранено!";

    # Сохраним на день
    setcookie("username", $username, time() + 24 * 3600);
    setcookie("email", $from, time() + 24 * 3600);
    setcookie("date", $date, time() + 24 * 3600);
    setcookie("gender", $gender, time() + 24 * 3600);
    $_SESSION['subject'] = '';
    $_SESSION['message'] = '';

    // Создаем соединение
    $db = new PDO('mysql:host=localhost;dbname=products', 'root', '');
    // Проверяем соединение
    if (!$db) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $request = "INSERT INTO feedback (name, email, db, gender, subject, message) VALUES (?, ?, ?, ?, ?, ?)";
    $values = [$username, $from, (int)substr($date, 0, 4), $gender, $subject, $message];
    $query = $db->prepare($request);
    $query->execute($values);

    redirect();
} else {
    redirect();
}

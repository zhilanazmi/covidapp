<?php
$host = 'localhost';
$db_name = 'flutter';
$username = 'root'; // Default WAMP username
$password = ''; // Default WAMP password

try {
    $conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    exit();
}
?>

<?php
$host = 'sql302.infinityfree.com';
$db = 'if0_35950419_crud_synteko';
$user = 'if0_35950419';
$pass = '0WX8kWNcomn3pF';

$dsn = "mysql:host=$host;dbname=$db;charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die('Erro na conexão com o banco de dados: ' . $e->getMessage());
}
?>

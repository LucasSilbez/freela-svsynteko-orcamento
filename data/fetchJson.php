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

$stmtLaminados = $pdo->query('SELECT * FROM laminados');
$dadosLaminados = $stmtLaminados->fetchAll(PDO::FETCH_ASSOC);

$stmtRodapes = $pdo->query('SELECT * FROM rodapes');
$dadosRodapes = $stmtRodapes->fetchAll(PDO::FETCH_ASSOC);

$stmtAcessorios = $pdo->query('SELECT * FROM acessorios');
$dadosAcessorios = $stmtAcessorios->fetchAll(PDO::FETCH_ASSOC);

$stmtVinilicos = $pdo->query('SELECT * FROM vinilicos');
$dadosVinilicos = $stmtVinilicos->fetchAll(PDO::FETCH_ASSOC);


$resultado = [
    'laminados' => $dadosLaminados,
    'rodapes' => $dadosRodapes,
    'acessorios' => $dadosAcessorios,
    'vinilicos' => $dadosVinilicos
];

$json = json_encode($resultado);

header('Content-Type: application/json');
echo $json;
?>
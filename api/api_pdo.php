<?php

// Koneksi ke Database
$host = 'localhost';
$db = 'buah.in';
$user = 'root';
$password = '';

try {
    $connection = new PDO("mysql:host=$host;dbname=$db", $user, $password);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(array('status' => 'error', 'message' => 'Gagal terkoneksi dengan database'));
    exit();
}

header('Content-Type: application/json');

// API Endpoint: Welcome Server
if ($_SERVER['REQUEST_METHOD'] === 'GET' && empty($_GET['action'])) {
    echo json_encode(array('status' => 'success', 'message' => 'Selamat datang di API Buah.in'));
    exit();
}

// API Endpoint: Get All Data
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] == 'get_all_data') {
    $query = $connection->prepare('SELECT id, nama, deskripsi, gambar, link_gambar FROM tbl_buah');
    $query->execute();
    $data = $query->fetchAll(PDO::FETCH_ASSOC);

    if ($data) {
        echo json_encode(array('status' => 'success', 'message' => 'Berhasil mendapatkan semua data', 'data' => $data));
    } else {
        echo json_encode(array('status' => 'error', 'message' => 'Gagal mendapatkan semua data'));
    }
}

// API Endpoint: Get Data by ID
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] == 'get_data_by_id') {
    $id = $_GET['id'];
    $query = $connection->prepare('SELECT id, nama, deskripsi, gambar, link_gambar FROM tbl_buah WHERE id = :id');
    $query->bindParam(':id', $id);
    $query->execute();
    $data = $query->fetch(PDO::FETCH_ASSOC);

    if ($data) {
        echo json_encode(array('status' => 'success', 'message' => 'Berhasil mendapatkan data berdasarkan id yang dimasukkan', 'data' => $data));
    } else {
        echo json_encode(array('status' => 'error', 'message' => 'Gagal mendapatkan data berdasarkan id yang dimasukkan'));
    }
}

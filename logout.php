<?php
session_start();

// Menghapus semua data dalam session
$_SESSION = [];

// Menghapus semua variabel session
session_unset();

// Menghancurkan session
session_destroy();

// Menghapus cookie 'id' dengan mengatur waktu kedaluwarsa ke belakang (sebelum saat ini)
setcookie('id', '', time() - 3600);

// Menghapus cookie 'key' dengan mengatur waktu kedaluwarsa ke belakang (sebelum saat ini)
setcookie('key', '', time() - 3600);

// Mengarahkan pengguna kembali ke halaman login dengan pesan "keluar" sebagai parameter pesan
header('location: login.php?pesan=keluar');

// Menghentikan eksekusi skrip setelah melakukan pengalihan header
exit;

<?php

$server = "localhost";
$username = "root";
$password = "";
$database = "buah.in";

$con = mysqli_connect($server, $username, $password, $database) or die('Gagal Menghubungkan');

$query = "SELECT * FROM tbl_buah";
$result = mysqli_query($con, $query);
$row = mysqli_affected_rows($con);

if ($row > 0) {
    $res = array();

    while ($ambil = mysqli_fetch_assoc($result)) {
        $a["id"] = intval($ambil['id']);
        $a["nama"] = $ambil['nama'];
        $a["deskripsi"] = $ambil['deskripsi'];
        $a["gambar"] = $ambil['gambar'];
        $a["link_gambar"] = $ambil['link_gambar'];

        $res[] = $a;
    }

    header('Content-Type: application/json');
    echo json_encode($res);
} else {
    $res["message"] = "Gagal mendapatkan data";
}

mysqli_close($con);

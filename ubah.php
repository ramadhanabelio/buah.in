<?php
session_start();

// Mengecek apakah pengguna sudah login atau belum
if (!isset($_SESSION["login"])) {
	header("Location: login.php");
	exit;
}

require 'functions.php';

// Mengambil data dari URL
$id = $_GET["id"];

// Mengambil data buah berdasarkan id
$buah = query("SELECT * FROM tbl_buah WHERE id = $id")[0];

// Mengecek apakah tombol submit sudah ditekan atau belum
if (isset($_POST["submit"])) {

	// Mengecek apakah data berhasil diubah atau tidak
	if (ubah($_POST) > 0) {
		echo "
			<script>
				alert('Data berhasil diubah!');
				document.location.href = 'dashboard.php';
			</script>
		";
	} else {
		echo "
			<script>
				alert('Data gagal diubah!');
				document.location.href = 'dashboard.php';
			</script>
		";
	}
}
?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin Buah.in · Ubah Data</title>
	<link rel="icon" href="img/Logo.ico" type="image/x-icon">
	<!-- CSS Bootstrap CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<!-- Icon Bootstrap CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
	<!-- Font Awesome CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<!-- CSS External -->
	<!-- <link href="css/landing-page.css" rel="stylesheet"> -->
</head>

<body>
	<h1 class="text-center pt-4">Ubah Data</h1>

	<div class="container">
		<form action="" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="<?= $buah["id"]; ?>">
			<input type="hidden" name="gambarLama" value="<?= $buah["gambar"]; ?>">

			<div class="mb-3">
				<label for="nama" class="form-label">Nama : </label>
				<input type="text" class="form-control" name="nama" id="nama" required value="<?= $buah["nama"]; ?>">
			</div>
			<div class="mb-3">
				<label for="deskripsi" class="form-label">Deskripsi :</label>
				<textarea type="text" class="form-control" rows="3" name="deskripsi" id="deskripsi"><?= isset($_POST["deskripsi"]) ? $_POST["deskripsi"] : $buah["deskripsi"]; ?></textarea>
			</div>

			<div class="mb-3">
				<label for="gambar" class="form-label">Gambar :</label> <br>
				<img src="img/<?= $buah['gambar']; ?>" width="20%" class="img-thumbnail mb-3"> <br>
				<input type="file" class="form-control" name="gambar" id="gambar">
			</div>
			<div class="mb-3">
				<label for="link_gambar" class="form-label">Link Gambar :</label>
				<input type="text" class="form-control" name="link_gambar" id="link_gambar" value="<?= $buah["link_gambar"]; ?>">
			</div>
			<div>
				<button type="submit" class="btn btn-success mb-4" name="submit" style="background-color: #33860b; color:#ffffff">Ubah</button>
			</div>
		</form>
	</div>

	<!-- JavaScript External -->
	<!-- <script src="js/script.js"></script> -->
	<!-- JavaScript Bootstrap CDN -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</body>

</html>
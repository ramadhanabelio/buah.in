<?php
session_start();

// Mengecek apakah pengguna sudah login atau belum
if (!isset($_SESSION["login"])) {
	header("Location: login.php");
	exit;
}

require 'functions.php';

$id = $_GET["id"];

// Mengecek apakah data berhasil dihapus atau tidak
if (hapus($id) > 0) {
	echo "
		<script>
			alert('Data berhasil dihapus!');
			document.location.href = 'dashboard.php';
		</script>
	";
} else {
	echo "
		<script>
			alert('Data gagal dihapus!');
			document.location.href = 'dashboard.php';
		</script>
	";
}

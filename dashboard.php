<?php
session_start();

// Mengecek apakah pengguna sudah login atau belum
if (!isset($_SESSION["login"])) {
	header("Location:login.php?pesan=belum_login");
	exit;
}

require 'functions.php';

// Mengambil semua data buah
$buah = query("SELECT * FROM tbl_buah");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$keyword = $_POST['keyword'];

	// Jika logo navbar ditekan, reset pencarian
	if (empty($keyword)) {
		$hasil_pencarian = $buah;
	} else {
		// Memanggil fungsi cari() dengan keyword yang diinputkan
		$hasil_pencarian = cari($keyword);
	}

	// Jika tidak ada hasil pencarian
	if (empty($hasil_pencarian)) {
		$data_tidak_ditemukan = true;
	}
} else {
	$hasil_pencarian = $buah;
}
?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin Buah.in · Dashboard</title>
	<link rel="icon" href="img/Logo.ico" type="image/x-icon">
	<!-- CSS Bootstrap CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<!-- Icon Bootstrap CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
	<!-- Font Awesome CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<!-- CSS External -->
	<link href="css/dashboard.css" rel="stylesheet">
</head>

<body>
	<!-- Navbar Start -->
	<header class="navbar navbar-expand-white sticky-top bg-white flex-md-nowrap p-0 mb-5 shadow-sm">
		<a class="navbar-brand col-md-auto col-lg-2 me-0 px-3 fs-6 text-center" href="dashboard.php"><img src="img/Buah.in.png" width="30%"> </a>
		<form action="" method="post" class="col-md">
			<input type="text" class="form-cari form-control bg-light w-100 rounded-0 border-0" name="keyword" autocomplete="off" id="keyword" placeholder="Masukkan keyword pencarian . . ." aria-label=>
		</form>
		<div class="navbar-nav">
			<div class="nav-item text-nowrap">
				<a class="nav-link px-3 rounded" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="bi bi-box-arrow-right"></i> &nbsp; Keluar</a>
			</div>
		</div>
	</header>
	<!-- Navbar End -->

	<div class="container-fluid mb-4">
		<a href="tambah.php" class="btn btn-success" style="background-color: #33860b; color:#ffffff">+ Tambah Data Buah</a>
	</div>

	<div class="container-fluid">
		<table class="table table-striped">
			<tr class="text-center">
				<th>No.</th>
				<th>Gambar</th>
				<th>Nama</th>
				<th>Deskripsi</th>
				<th class="aksi">Aksi</th>
			</tr>
			<?php if (count($hasil_pencarian) > 0) : ?>
				<?php $i = 1; ?>
				<?php foreach ($hasil_pencarian as $row) : ?>
					<tr>
						<td><?= $i; ?></td>
						<td class="text-center"><img src="img/<?= $row["gambar"]; ?>" class="img-responsive" alt="Gambar buah"></td>
						<td><?= $row["nama"]; ?></td>
						<td><?= $row["deskripsi"]; ?></td>
						<td class="aksi">
							<a href="ubah.php?id=<?php echo $row['id']; ?>" class="badge bg-warning"><i class="bi bi-pencil-square"></i></a>
							<button type="button" class="badge bg-danger" data-bs-toggle="modal" data-bs-target="#hapusModal<?php echo $row['id']; ?>"><i class="bi bi-trash3"></i></button>
						</td>
					</tr>

					<!-- Modal Hapus Start -->
					<div class="modal fade" id="hapusModal<?php echo $row['id']; ?>" tabindex="-1" aria-labelledby="hapusModalLabel<?php echo $row['id']; ?>" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="hapusModalLabel<?php echo $row['id']; ?>">Konfirmasi Hapus</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<p>Apakah Anda yakin ingin menghapus data ini?</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
									<a href="hapus.php?id=<?php echo $row['id']; ?>" class="btn btn-danger">Hapus</a>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal Hapus End -->

					<?php $i++; ?>
				<?php endforeach; ?>
			<?php else : ?>
				<tr>
					<td colspan="5" class="text-center">Data tidak ditemukan</td>
				</tr>
			<?php endif; ?>
		</table>
	</div>

	<!-- Modal Logout Start -->
	<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="logoutModalLabel">Konfirmasi Keluar</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Apakah Anda yakin ingin keluar?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
					<a href="logout.php" class="btn btn-danger">Keluar</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Logout End -->

	<!-- JavaScript Bootstrap CDN -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</body>

</html>
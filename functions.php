<?php

// Koneksi ke database
$conn = mysqli_connect("localhost", "root", "", "buah.in");

// Fungsi untuk menjalankan query dan mengembalikan hasil dalam bentuk array asosiatif
function query($query)
{
	global $conn;
	$result = mysqli_query($conn, $query);
	$rows = [];
	while ($row = mysqli_fetch_assoc($result)) {
		$rows[] = $row;
	}
	return $rows;
}

// Fungsi untuk menambahkan data ke database
function tambah($data)
{
	global $conn;

	$nama = htmlspecialchars($data["nama"]);
	$deskripsi = htmlspecialchars($data["deskripsi"]);
	$link_gambar = htmlspecialchars($data["link_gambar"]);

	// Unggah gambar
	$gambar = upload();
	if (!$gambar) {
		return false;
	}

	$query = "INSERT INTO tbl_buah
				VALUES
			  ('', '$nama', '$deskripsi', '$gambar', '$link_gambar')
			";
	mysqli_query($conn, $query);

	return mysqli_affected_rows($conn);
}

// Fungsi untuk mengunggah gambar
function upload()
{
	$namaFile = $_FILES['gambar']['name'];
	$ukuranFile = $_FILES['gambar']['size'];
	$error = $_FILES['gambar']['error'];
	$tmpName = $_FILES['gambar']['tmp_name'];

	// Mengecek apakah gambar diunggah
	if ($error === 4) {
		echo "<script>
				alert('Silahkan pilih gambar terlebih dahulu!');
			  </script>";
		return false;
	}

	// Mengecek apakah yang diunggah merupakan gambar
	$ekstensiGambarValid = ['jpg', 'jpeg', 'png'];
	$ekstensiGambar = explode('.', $namaFile);
	$ekstensiGambar = strtolower(end($ekstensiGambar));
	if (!in_array($ekstensiGambar, $ekstensiGambarValid)) {
		echo "<script>
				alert('Yang anda upload bukan gambar!');
			  </script>";
		return false;
	}

	// Mengecek ukuran gambar
	if ($ukuranFile > 3000000) {
		echo "<script>
				alert('Ukuran gambar terlalu besar!');
			  </script>";
		return false;
	}

	// Lolos pengecekan, gambar siap diupload
	// Membuat nama file baru secara unik
	$namaFileBaru = uniqid();
	$namaFileBaru .= '.';
	$namaFileBaru .= $ekstensiGambar;

	move_uploaded_file($tmpName, 'img/' . $namaFileBaru);

	return $namaFileBaru;
}

// Fungsi untuk menghapus data dari database
function hapus($id)
{
	global $conn;
	mysqli_query($conn, "DELETE FROM tbl_buah WHERE id = $id");
	return mysqli_affected_rows($conn);
}

// Fungsi untuk mengubah data di database
function ubah($data)
{
	global $conn;

	$id = $data["id"];
	$nama = htmlspecialchars($data["nama"]);
	$deskripsi = htmlspecialchars($data["deskripsi"]);
	$link_gambar = htmlspecialchars($data["link_gambar"]);
	$gambarLama = htmlspecialchars($data["gambarLama"]);

	// Mengecek apakah ada gambar yang diunggah
	if ($_FILES['gambar']['error'] === 4) {
		$gambar = $gambarLama;
	} else {
		$gambar = upload();
	}

	$query = "UPDATE tbl_buah SET
				nama = '$nama',
				deskripsi = '$deskripsi',
				link_gambar = '$link_gambar',
				gambar = '$gambar'
			WHERE id = $id
			";

	mysqli_query($conn, $query);

	return mysqli_affected_rows($conn);
}

// Fungsi untuk mencari data buah berdasarkan keyword
function cari($keyword)
{
	$sql = "SELECT * FROM tbl_buah WHERE nama LIKE '%$keyword%'";
	return query($sql);
}

// Fungsi untuk melakukan registrasi admin baru
function registrasi($data)
{
	global $conn;

	$username = strtolower(stripslashes($data["username"]));
	$password = mysqli_real_escape_string($conn, $data["password"]);
	$password2 = mysqli_real_escape_string($conn, $data["password2"]);

	// Mengecek apakah username sudah terdaftar
	$result = mysqli_query($conn, "SELECT username FROM tbl_admin WHERE username = '$username'");

	if (mysqli_fetch_assoc($result)) {
		echo "<script>
				alert('username sudah terdaftar!')
		      </script>";
		return false;
	}

	// Mengecek konfirmasi password
	if ($password !== $password2) {
		echo "<script>
				alert('konfirmasi password tidak sesuai!');
		      </script>";
		return false;
	}

	// Mengenkripsi password
	$password = password_hash($password, PASSWORD_DEFAULT);

	// Menambahkan user baru ke database
	mysqli_query($conn, "INSERT INTO tbl_admin VALUES('', '$username', '$password')");

	return mysqli_affected_rows($conn);
}

class Buah {
  final int id;
  final String nama;
  final String deskripsi;
  final String gambar;

  const Buah({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.gambar,
  });

  factory Buah.fromJson(Map<String, dynamic> json) {
    return Buah(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
    );
  }

  static List<Buah> buahFromSnapshot(List<dynamic> snapshot) {
    return snapshot.map((data) {
      return Buah.fromJson(data as Map<String, dynamic>);
    }).toList();
  }

  @override
  String toString() {
    return 'Buah {id: $id, nama: $nama, deskripsi: $deskripsi, gambar: $gambar}';
  }
}
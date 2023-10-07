import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Buah {
  final String gambar;
  final String nama;
  final String deskripsi;

  Buah({required this.gambar, required this.nama, required this.deskripsi});

  factory Buah.fromJson(Map<String, dynamic> json) {
    return Buah(
      gambar: json['gambar'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
    );
  }
}

Future<List<Buah>> fetchBuahList() async {
  final response = await http.get(Uri.parse("https://sdlab.polbeng.web.id/web/rpl_6a/kelompok8_buah.in/api_read.php"));

  if (response.statusCode == 200) {
    var data = json.decode(response.body) as List;
    return data.map((json) => Buah.fromJson(json)).toList();
  } else {
    throw Exception('Gagal Terhubung ke API Buah.in');
  }
}

class BuahList extends StatefulWidget {
  const BuahList({Key? key}) : super(key: key);

  @override
  _BuahListState createState() => _BuahListState();
}

class _BuahListState extends State<BuahList> {
  late Future<List<Buah>> futureBuahList;

  @override
  void initState() {
    super.initState();
    futureBuahList = fetchBuahList();
  }

  void _showDetail(BuildContext context, Buah buah) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  buah.nama,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Image.network(
                  "https://sdlab.polbeng.web.id/web/rpl_6a/kelompok8_buah.in/img/${buah.gambar}",
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    buah.deskripsi,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Tutup'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _refreshBuahList() async {
    setState(() {
      futureBuahList = fetchBuahList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RefreshIndicator(
          onRefresh: _refreshBuahList,
          child: FutureBuilder<List<Buah>>(
            future: futureBuahList,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Buah buah = snapshot.data![index];
                  return Card(
                    child: InkWell(
                      onTap: () => _showDetail(context, buah),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                "https://sdlab.polbeng.web.id/web/rpl_6a/kelompok8_buah.in/img/${buah.gambar}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    buah.nama,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    buah.deskripsi.length > 50
                                        ? '${buah.deskripsi.substring(0, 50)}...'
                                        : buah.deskripsi,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Buah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BuahList(),
    );
  }
}

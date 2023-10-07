import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'developer_screen.dart';
import 'list_screen.dart';

Future buah() async {
  final response = await http.get(Uri.parse("https://sdlab.polbeng.web.id/web/rpl_6a/kelompok8_buah.in/api_read.php"));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Gagal Terhubung ke API Buah.in');
  }
}

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buah.in',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/profile': (context) => const DeveloperScreen(),
      },
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Buah.in')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: FractionalTranslation(
          translation: const Offset(-1, 0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Lottie.asset(
              'images/splash.json',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(title),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: const Center(
        child: BuahList(),
      ),
    );
  }
}

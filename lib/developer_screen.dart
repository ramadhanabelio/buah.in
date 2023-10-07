import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({Key? key});

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Gagal menampilkan $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Developer',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        children: [
          _buildDeveloperCard(
            name: 'Ramadhan Abelio Nusa Putra',
            role: 'Software Developer',
            imagePath: 'images/abelio.jpg',
            instagramUrl: 'https://instagram.com/ramadhan.abelio',
            linkedinUrl: 'https://www.linkedin.com/in/ramadhan-abelio-nusa-putra/',
            githubUrl: 'https://github.com/ramadhanabelio',
          ),
          const SizedBox(height: 24.0),
          _buildDeveloperCard(
            name: 'Nurul Aini',
            role: 'UI/UX Designer',
            imagePath: 'images/nurul.jpg',
            instagramUrl: 'https://instagram.com/_nurullaaini',
          ),
        ],
      ),
    );
  }

  Widget _buildDeveloperCard({
    required String name,
    required String role,
    required String imagePath,
    required String instagramUrl,
    String? linkedinUrl,
    String? githubUrl,
  }) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 16.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              role,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _launchURL(instagramUrl);
                  },
                  icon: Image.asset(
                    'images/icon_instagram.png',
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                if (linkedinUrl != null)
                  IconButton(
                    onPressed: () {
                      _launchURL(linkedinUrl);
                    },
                    icon: Image.asset(
                      'images/icon_linkedin.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                if (githubUrl != null)
                  IconButton(
                    onPressed: () {
                      _launchURL(githubUrl);
                    },
                    icon: Image.asset(
                      'images/icon_github.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

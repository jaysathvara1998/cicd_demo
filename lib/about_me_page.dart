import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('About Me'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage:
                  AssetImage('assets/profile.png'), // Add image in assets
            ),
            const SizedBox(height: 16),
            const Text(
              'Jay Sathvara',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Flutter & Android Developer',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const Text(
              'I am a passionate Flutter and Native Android Developer with 4+ years of experience. '
              'I specialize in building scalable mobile apps with clean architecture, performance optimization, '
              'Firebase integration, and CI/CD. I love crafting beautiful UI and seamless UX experiences.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Skills:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _skillChip('Flutter'),
                _skillChip('Dart'),
                _skillChip('Android (Kotlin/Java)'),
                _skillChip('Firebase'),
                _skillChip('REST APIs'),
                _skillChip('Clean Architecture'),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(),
            const Text('Connect with me'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon(Icons.linked_camera,
                    'https://www.linkedin.com/in/jay-sathvara/'),
                const SizedBox(width: 16),
                _socialIcon(Icons.code, 'https://github.com/jaysathvara1998'),
                const SizedBox(width: 16),
                _socialIcon(Icons.email, 'mailto:jaysathvara1998@.com'),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget _skillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.deepPurple.shade50,
      labelStyle: const TextStyle(color: Colors.deepPurple),
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: CircleAvatar(
        backgroundColor: Colors.deepPurple,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

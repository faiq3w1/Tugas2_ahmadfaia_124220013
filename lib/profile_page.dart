import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Tambahkan package ini untuk meluncurkan URL
import 'login_page.dart'; // Import halaman login untuk navigasi

class ProfilePage extends StatelessWidget {
  final String username;
  final String email;

  const ProfilePage({super.key, required this.username, required this.email});

  // Fungsi untuk membuka URL menggunakan url_launcher
  Future<void> _launchURL() async {
    const url =
        'https://instagram.com/faiqqsyp_'; // Ganti dengan URL tentang aplikasi Anda
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Mengatur lebar menjadi penuh
        height: double.infinity, // Mengatur tinggi menjadi penuh
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade900,
              Colors.black,
            ],
          ),
        ),
        child: Center(
          // Mengatur konten di tengah
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.all(30), // Padding di dalam kotak
              decoration: BoxDecoration(
                color:
                    Colors.white, // Ubah warna background kotak menjadi putih
                borderRadius: BorderRadius.circular(20), // Sudut membulat
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Warna bayangan
                    blurRadius: 10.0, // Mengatur efek blur bayangan
                    spreadRadius: 2.0, // Mengatur sebaran bayangan
                    offset: const Offset(0, 4), // Posisi bayangan
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Mengatur ukuran kolom
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // Space before title
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple, // Ubah warna teks judul
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Menampilkan username
                  Text(
                    'Username: $email', // Format username ditampilkan
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed:
                        _launchURL, // Panggil fungsi untuk meluncurkan URL
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.deepPurple.shade600,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('About App (Button launch url)'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman login saat logout
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.deepPurple.shade600,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

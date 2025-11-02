import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Tambahkan ini
import 'pages/visimisi_page.dart';
import 'pages/fakultas_page.dart';
import 'pages/prodi_page.dart';
import 'pages/kontak_page.dart';

void main() {
  runApp(const KampusApp());
}

class KampusApp extends StatelessWidget {
  const KampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UMSIDA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1E88E5),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/home': (context) => const HomePage(),
        '/visimisi': (context) => const VisiMisiPage(),
        '/fakultas': (context) => const FakultasPage(),
        '/prodi': (context) => const ProdiPage(),
        '/kontak': (context) => const KontakPage(),
      },
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.blue.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                // Logo - PASTIKAN FILE ADA DI assets/images/logo.png
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'UNIVERSITAS MUHAMMADIYAH SIDOARJO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Unggul, Islami, dan Berkarakter',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Gambar Kampus - PASTIKAN FILE ADA DI assets/images/umsida.jpg
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/umsida.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.account_balance,
                            size: 60,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Deskripsi - CARD KECIL
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Tentang UMSIDA',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Universitas Muhammadiyah Sidoarjo merupakan perguruan tinggi modern yang berkomitmen mencetak generasi unggul, berilmu, dan berakhlak mulia.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ),
                          const SizedBox(height: 16),

                          // Menu Navigasi KECIL
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _menuButton(
                                context,
                                Icons.flag,
                                'Visi Misi',
                                '/visimisi',
                              ),
                              _menuButton(
                                context,
                                Icons.school,
                                'Fakultas',
                                '/fakultas',
                              ),
                              _menuButton(
                                context,
                                Icons.book,
                                'Prodi',
                                '/prodi',
                              ),
                              _menuButton(
                                context,
                                Icons.phone,
                                'Kontak',
                                '/kontak',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Info Kontak - CARD KECIL
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Kontak Kami',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _contactItem(
                            Icons.location_on,
                            'Jl. Mojopahit 666B, Sidoarjo',
                          ),
                          _contactItem(Icons.phone, '(031) 8945444'),
                          _contactItem(Icons.email, 'info@umsida.ac.id'),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/kontak'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade800,
                              ),
                              child: const Text(
                                'Lihat Detail Kontak',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _menuButton(
  BuildContext context,
  IconData icon,
  String label,
  String route,
) {
  return Column(
    children: [
      IconButton(
        onPressed: () => Navigator.pushNamed(context, route),
        icon: Icon(icon, color: Colors.blue.shade800),
        iconSize: 30,
      ),
      Text(
        label,
        style: const TextStyle(fontSize: 11),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget _contactItem(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade600),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'widgets/umsida_header.dart';
import 'widgets/umsida_menu_bar.dart';

class FakultasPage extends StatelessWidget {
  const FakultasPage({super.key});

  final List<Map<String, String>> fakultas = const [
    {
      'nama': 'Fakultas Sains dan Teknologi',
      'singkatan': 'FST',
      'gambar': 'assets/images/fst.png',
    },
    {
      'nama': 'Fakultas Bisnis, Hukum, dan Ilmu Sosial',
      'singkatan': 'FBHIS',
      'gambar': 'assets/images/fbhis.png',
    },
    {
      'nama': 'Fakultas Psikologi dan Ilmu Pendidikan',
      'singkatan': 'FPIP',
      'gambar': 'assets/images/fpip.png',
    },
    {
      'nama': 'Fakultas Agama Islam',
      'singkatan': 'FAI',
      'gambar': 'assets/images/fai.png',
    },
    {
      'nama': 'Fakultas Ilmu Kesehatan',
      'singkatan': 'FIKES',
      'gambar': 'assets/images/fk.png',
    },
    {
      'nama': 'Fakultas Kedokteran Gigi',
      'singkatan': 'FKG',
      'gambar': 'assets/images/fkg.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const UmsidaHeader(),
            const UmsidaMenuBar(),

            // 👉 Konten utama + footer ikut scroll
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'FAKULTAS',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 7, 56, 96),
                      ),
                    ),

                    const SizedBox(height: 40), // jarak antar teks dan Wrap
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: fakultas.map((f) {
                        return SizedBox(
                          width: 500,
                          // 2 kolom
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/prodi');
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 3,
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // 👉 Gambar ditempel di dalam card
                                  if (f['gambar'] != null)
                                    Image.asset(
                                      f['gambar']!,
                                      height: 500, //buat atur ukuran gambar
                                      fit: BoxFit.cover,
                                    ),

                                  // 👉 Teks di bawah gambar
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      children: [
                                        Text(
                                          f['nama']!,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          f['singkatan']!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    // 👉 Footer ikut scroll
                    _buildFooter(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFooter(BuildContext context) {
  return Container(
    width: double.infinity,
    color: Colors.blue[900],
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo2.png', height: 50),
            const SizedBox(width: 12),
            const Text(
              'UNIVERSITAS MUHAMMADIYAH SIDOARJO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Jl. Mojopahit 666 B, Sidoarjo, Jawa Timur 61215\n'
          'Telp: (031) 8945444 | Email: info@umsida.ac.id',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 20),
        Container(width: 120, height: 2, color: Colors.amberAccent),
        const SizedBox(height: 16),
        Text(
          '© ${DateTime.now().year} Universitas Muhammadiyah Sidoarjo. All rights reserved.',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    ),
  );
}

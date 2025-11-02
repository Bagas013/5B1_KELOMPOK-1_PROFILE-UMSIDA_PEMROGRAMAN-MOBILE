import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/umsida_header.dart';
import 'widgets/umsida_menu_bar.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const UmsidaHeader(),
            const UmsidaMenuBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: const [
                            Text(
                              'KONTAK',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 7, 56, 96),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone, color: Colors.green),
                              title: Text('Telepon'),
                              subtitle: Text('(031) 8945444'),
                            ),
                            ListTile(
                              leading: Icon(Icons.email, color: Colors.blue),
                              title: Text('Email'),
                              subtitle: Text('info@umsida.ac.id'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.language,
                                color: Colors.purple,
                              ),
                              title: Text('Website'),
                              subtitle: Text('www.umsida.ac.id'),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Text(
                      'LOKASI KAMPUS',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 7, 56, 96),
                      ),
                    ),

                    const SizedBox(height: 40), // jarak antar teks dan Wrap

                    Wrap(
                      spacing: 120,
                      runSpacing: 50,
                      children: [
                        _buildMapCard(
                          'assets/images/maps_kampus1.png',
                          'https://maps.google.com/?q=Universitas+Muhammadiyah+Sidoarjo',
                          'KAMPUS 1',
                        ),
                        _buildMapCard(
                          'assets/images/maps_kampus2.png',
                          'https://maps.app.goo.gl/gkfGEDDBX2PZbAeV9',
                          'KAMPUS 2',
                        ),
                        _buildMapCard(
                          'assets/images/maps_kampus3.png',
                          'https://maps.app.goo.gl/TPqdCqWjRsrtdhwB7',
                          'KAMPUS 3',
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
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


Widget _buildMapCard(String imagePath, String url, String label) {
  return SizedBox(
    width: 300, // atur lebar tiap kartu
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 400, // atur lebar gambar maps
            height: 250, // atur tinggi gambar maps
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () async {
            final Uri maps = Uri.parse(url);
            if (await canLaunchUrl(maps)) {
              await launchUrl(maps, mode: LaunchMode.externalApplication);
            }
          },
          icon: const Icon(Icons.map),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade800,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    ),
  );
}

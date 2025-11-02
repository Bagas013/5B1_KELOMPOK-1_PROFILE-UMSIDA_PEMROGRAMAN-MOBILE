import 'dart:async';
import 'package:flutter/material.dart';
import 'widgets/umsida_header.dart';
import 'widgets/umsida_menu_bar.dart';

class VisiMisiPage extends StatefulWidget {
  const VisiMisiPage({super.key});

  @override
  State<VisiMisiPage> createState() => _VisiMisiPageState();
}

class _VisiMisiPageState extends State<VisiMisiPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> imagePaths = ['assets/images/visimisi1.jpeg'];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(), // slideshow muncul di sini
                    const SizedBox(height: 20),

                    const Text(
                      'VISI',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Menjadi perguruan tinggi unggul dan inovatif dalam pengembangan IPTEKS berdasarkan nilai-nilai Islam untuk kesejahteraan masyarakat.',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'MISI',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      '1. Puji syukur kita panjatkan kehadirat Allah SWT, yang telah memberikan rahmat dan hidayah-Nya sehingga kita dapat berkumpul pada moment yang penuh berkah ini. Shalawat serta salam senantiasa tercurah kepada Rasulullah Muhammad SAW, keluarga, sahabat, dan umat Islam seluruhnya.\n'
                      '2. Meningkatkan penelitian yang mendukung proses pembelajaran dan pengembangan IPTEKS untuk kesejahteraan masyarakat. \n'
                      '3. Puji syukur kita panjatkan kehadirat Allah SWT, yang telah memberikan rahmat dan hidayah-Nya sehingga kita dapat berkumpul pada moment yang penuh berkah ini. Shalawat serta salam senantiasa tercurah kepada Rasulullah Muhammad SAW, keluarga, sahabat, dan umat Islam seluruhnya. \n'
                      '4. Meningkatkan kerjasama dengan lembaga di dalam dan luar negeri. \n'
                      '5. Meningkatkan tata kelola secara professional berdasarkan nilai-nilai Islam. \n'
                      '6. Meningkatkan pembinaan dan pengembangan kemahasiswaan berdasarkan nilai-nilai Islam.',
                      style: TextStyle(fontSize: 15, height: 1.6),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'TUJUAN',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      '1. Menghasilkan lulusan yang profesional dalam penguasaan IPTEKS berdasarkan nilai- nilai Islam. \n'
                      '2. Menghasilkan penelitian untuk kesejateraan masyarakat. \n'
                      '3. Mewujudkan pengabdian kepada masyarakat untuk kesejahteraan masyarakat.\n'
                      '4. Mewujudkan kerjasama dengan lembaga di dalam dan luar negeri untuk penguatan Catur Dharma Perguruan Tinggi Muhammadiyah. \n'
                      '5. Mewujudkan kemandirian perguruan tinggi dengan tata kelola yang profesional berdasarkan nilai- nilai Islam \n'
                      '6. Meningkatkan prestasi akademik dan non akademik mahasiswa. \n',
                      style: TextStyle(fontSize: 15, height: 1.6),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'SASARAN',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      '1. Peningkatan kemampuan mahasiswa dalam penguasaan dan pengembangan IPTEKS berdasarkan nilai-nilai Islam. \n'
                      '2. Peningkatan kapasitas dan kinerja penelitian dosen dan mahasiswa yang mendukung proses pembelajaran dan pengembangan IPTEKS. \n'
                      '3. Peningkatan manfaat hasil penelitian untuk kesejahteraan masyarakat.\n'
                      '4. Peningkatan kapasitas dan kinerja pengabdian kepada masyarakat untuk kesejahteraan masyarakat. \n'
                      '5. Peningkatan dan perluasan kerjasama dengan lembaga dalam dan luar negeri. \n'
                      '6. Penguatan tata kelola dan kelembagaan secara profesional berdasarkan nilai-nilai Islam. \n'
                      '7. Peningkatan etos kerja dan perilaku organisasi yang sesuai dengan nilai-nilai Islam dan Kemuhammadiyahan. \n'
                      '8. Peningkatan kemampuan mahasiswa dalam pencapaian prestasi. \n',
                      style: TextStyle(fontSize: 15, height: 1.6),
                      textAlign: TextAlign.justify,
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

  Widget _buildImage() {
    return SizedBox(
      height: 400, //TINGGI GAMBAR
      child: PageView.builder(
        controller: _pageController,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          );
        },
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
        // Logo & Nama Kampus
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

        // Info kontak kampus
        const Text(
          'Jl. Mojopahit 666 B, Sidoarjo, Jawa Timur 61215\n'
          'Telp: (031) 8945444 | Email: info@umsida.ac.id',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),

        const SizedBox(height: 20),

        // Garis pembatas
        Container(width: 120, height: 2, color: Colors.amberAccent),

        const SizedBox(height: 16),

        // Copyright
        Text(
          '© ${DateTime.now().year} Universitas Muhammadiyah Sidoarjo. All rights reserved.',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'widgets/umsida_header.dart';
import 'widgets/umsida_menu_bar.dart';

class ProdiPage extends StatelessWidget {
  const ProdiPage({super.key});

  //Data prodi dikelompokkan per fakultas + deskripsi
  final List<Map<String, dynamic>> fakultasProdi = const [
    {
      'fakultas': 'Fakultas Sains dan Teknologi',
      'prodi': [
        {
          'nama': 'Teknik Informatika',
          'deskripsi':
              '1. Jurusan Teknik Informatika mempelajari perancangan, pengembangan, dan penerapan sistem komputer serta perangkat lunak untuk memecahkan berbagai permasalahan di dunia nyata. \n '
              '2. Teknik Informatika berfokus pada penguasaan teknologi informasi, pemrograman, kecerdasan buatan, jaringan komputer, serta keamanan siber. \n '
              '3. Lulusan Teknik Informatika diharapkan mampu menciptakan solusi teknologi yang inovatif dan efisien untuk mendukung transformasi digital di berbagai bidang. ',
          'gambar': 'assets/images/informatika1.jpg',
        },
        {
          'nama': 'Teknik Elektro',
          'deskripsi':
              'Fokus pada sistem kelistrikan, elektronika, dan telekomunikasi.',
        },
        {
          'nama': 'Teknik Mesin',
          'deskripsi': 'Mempelajari desain, manufaktur, dan perawatan mesin.',
        },
      ],
    },
    {
      'fakultas': 'Fakultas Bisnis, Hukum, dan Ilmu Sosial',
      'prodi': [
        {
          'nama': 'Manajemen',
          'deskripsi':
              'Belajar mengelola organisasi, SDM, keuangan, dan strategi bisnis.',
        },
        {
          'nama': 'Akuntansi',
          'deskripsi':
              'Fokus pada pencatatan, analisis, dan pelaporan keuangan.',
        },
        {
          'nama': 'Ilmu Komunikasi',
          'deskripsi':
              'Mempelajari media, public relations, dan komunikasi massa.',
        },
      ],
    },
    {
      'fakultas': 'Fakultas Psikologi dan Ilmu Pendidikan',
      'prodi': [
        {
          'nama': 'Psikologi',
          'deskripsi':
              'Mempelajari perilaku manusia, konseling, dan riset psikologi.',
        },
        {
          'nama': 'Pendidikan Guru SD',
          'deskripsi':
              'Mempersiapkan guru sekolah dasar dengan kompetensi pedagogik.',
        },
        {
          'nama': 'PG PAUD',
          'deskripsi':
              'Fokus pada pendidikan anak usia dini dan perkembangan anak.',
        },
      ],
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

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: fakultasProdi.length,
                itemBuilder: (context, index) {
                  final fakultas = fakultasProdi[index];
                  final prodiList =
                      fakultas['prodi'] as List<Map<String, String>>;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 👉 Judul Fakultas
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          fakultas['fakultas'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 7, 56, 96),
                          ),
                        ),
                      ),

                      //Daftar Prodi dengan ExpansionTile
                      ...prodiList.map((prodi) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          child: ExpansionTile(
                            leading: const Icon(Icons.book, color: Colors.blue),
                            title: Text(
                              prodi['nama']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            children: [
                              //tampilkan gambar 
                              if (prodi['gambar'] != null)
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      prodi['gambar']!,
                                      height: 400,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                              // deskripsi
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  prodi['deskripsi']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

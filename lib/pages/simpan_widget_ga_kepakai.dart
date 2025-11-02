// INI UNTUK SAMBUTAN REKTOR

// Widget _buildSambutanrektor(BuildContext context) {
//   return Card(
//     elevation: 2,
//     child: Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.asset(
//               'assets/images/rektor.png',
//               width: 600,
//               height: 600,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return const Icon(
//                   Icons.broken_image,
//                   size: 60,
//                   color: Colors.grey,
//                 );
//               },
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'Sambutan Rektor',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Text(
//                   'Assalamu’alaikum Warahmatullahi Wabarakatuh,',
//                   style: TextStyle(fontSize: 15, height: 1.6),
//                   textAlign: TextAlign.justify,
//                 ),
//                 const SizedBox(height: 13), // Jarak antar paragraf
//                 Text(
//                   'Puji syukur kita panjatkan kehadirat Allah SWT, yang telah memberikan rahmat dan hidayah-Nya sehingga kita dapat berkumpul pada moment yang penuh berkah ini. Shalawat serta salam senantiasa tercurah kepada Rasulullah Muhammad SAW, keluarga, sahabat, dan umat Islam seluruhnya.',
//                   style: TextStyle(fontSize: 15, height: 1.6),
//                   textAlign: TextAlign.justify,
//                 ),
//                 const SizedBox(height: 13), // Jarak antar paragraf
//                 Text(
//                   'Saya, sebagai Rektor Universitas Muhammadiyah Sidoarjo, mengucapkan selamat datang kepada seluruh civitas akademika, mahasiswa, dosen, karyawan, dan stakeholder lainnya yang telah bergabung dalam perjalanan pendidikan di Universitas Muhammadiyah Sidoarjo.',
//                   style: TextStyle(fontSize: 15, height: 1.6),
//                   textAlign: TextAlign.justify,
//                 ),
//                 const SizedBox(height: 13), // Jarak antar paragraf
//                 Text(
//                   'Universitas Muhammadiyah Sidoarjo hadir sebagai lembaga pendidikan yang berkomitmen untuk memberikan pendidikan berkualitas dengan mengutamakan nilai-nilai keislaman, keilmuan, dan keberdayaan masyarakat. Kami percaya bahwa pendidikan adalah kunci untuk mewujudkan generasi yang unggul dan berdaya saing tinggi. Dalam era globalisasi ini, Universitas Muhammadiyah Sidoarjo berusaha untuk terus berkembang dan berinovasi demi memenuhi tuntutan zaman. Melalui program akademik yang beragam, fasilitas yang memadai, dan dukungan dosen yang berkualitas, kami berkomitmen untuk menciptakan lingkungan belajar yang inspiratif dan mendukung pengembangan potensi setiap mahasiswa. Tidak hanya fokus pada aspek akademis, kami juga menekankan pentingnya pengembangan karakter, kepemimpinan, dan keterampilan soft skills. Hal ini bertujuan untuk menciptakan lulusan yang tidak hanya kompeten secara profesional, tetapi juga memiliki integritas, etika, dan rasa tanggung jawab sosial yang tinggi.',
//                   style: TextStyle(fontSize: 15, height: 1.6),
//                   textAlign: TextAlign.justify,
//                 ),
//                 const SizedBox(height: 13), // Jarak antar paragraf
//                 Text(
//                   'Kami mengajak seluruh civitas akademika untuk bersama-sama berkontribusi dalam membangun atmosfer akademik yang dinamis, inklusif, dan harmonis. Mari kita jalin kerjasama dan solidaritas untuk mencapai visi dan misi Universitas Muhammadiyah Sidoarjo.',
//                   style: TextStyle(fontSize: 15, height: 1.6),
//                   textAlign: TextAlign.justify,
//                 ),
//                 const SizedBox(height: 13), // Jarak antar paragraf
//                 Text(
//                   'Terima kasih kepada seluruh pihak yang telah mendukung dan berperan aktif dalam perjalanan kami. Semoga Allah SWT senantiasa memberikan taufik dan hidayah-Nya, sehingga kita dapat terus berkarya dan memberikan manfaat bagi umat, bangsa, dan agama.',
//                   style: TextStyle(fontSize: 15, height: 1.6),
//                   textAlign: TextAlign.justify,
//                 ),
//                 const SizedBox(height: 13), // Jarak antar paragraf
//                 Text(
//                   'Wassalamu’alaikum Warahmatullahi Wabarakatuh.',
//                   style: TextStyle(fontSize: 15, height: 1.6),
//                   textAlign: TextAlign.justify,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// INI UNTUK PROFILE UMSIDA
// Widget _buildProfileumsida(BuildContext context) {
//   return Card(
//     elevation: 2,
//     child: Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.asset(
//               'assets/images/logo2.png',
//               width: 300,
//               height: 300,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return const Icon(
//                   Icons.broken_image,
//                   size: 60,
//                   color: Colors.grey,
//                 );
//               },
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'Profile Umsida',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Text(
//                   'Universitas Muhammadiyah Sidoarjo (selanjutnya disebut UMSIDA) dengan semboyannya “Dari Sini Pencerahan Bersemi” termasuk salah satu universitas swasta di Jawa Timur yang berkomitmen menjadi salah satu perguruan tinggi unggul dan inovatif dalam pengembangan IPTEKS berdasarkan nilai-nilai Islam untuk kesejahteraan masyarakat di mana UMSIDA menjadi pusat pencerahan melalui pengembangan sumber daya manusia yang berorientasi pada iman, ilmu, dan amal serta pengembangan tradisi intelektual untuk mewujudkan masyarakat yang berkemajuan. UMSIDA akan terus berperan aktif dalam proses pembangunan nasional dengan melahirkan lulusan yang kompeten dan profesional di bidangnya, menguasai ilmu pengetahuan dan teknologi dengan dilandasi nilai- nilai keimanan dan akhak mulia. Harapannya, mereka menjadi insan yang mandiri, berwawasan luas, sadar akan keberadaannya dan bermanfaat bagi masyarakat Indonesia, serta ikhlas dan bersungguh-sungguh dalam melaksanakan tugas amar ma’ruf nahi munkar. Untuk mencapai cita tersebut, UMSIDA selanjutnya melaksanakan Catur Dharma Perguruan Tinggi yang mencakup pendidikan dan pengajaran, penelitian, pengabdian kepada masyarakat, dan pembinaan al-Islam dan Kemuhammadiyahan.',
//                   style: TextStyle(fontSize: 15, height: 1.6),
//                   textAlign: TextAlign.justify,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }




  //
                    // Column(
                    //   children: [
                    //     _buildVisiMisi(context), // hanya card visi misi
                    //   ],
                    // ),

                    // Column(
                    //   children: [
                    //     _buildFakultas(context), // hanya card visi misi
                    //   ],
                    // ),

//  Column(
//                       children: [
//                         _buildMenuUtama(context), // hanya card visi misi
//                       ],
//                     ),














// Widget _buildVisiMisi(BuildContext context) {
//   return SizedBox(
//     width: 200, // atur lebar card
//     height: 200, // atur tinggi card
//     child: Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       clipBehavior: Clip.antiAlias,
//       child: InkWell(
//         onTap: () {
//           Navigator.pushNamed(context, '/visimisi');
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Image.asset(
//               'assets/images/logo2.png',
//               height: 120, // tinggi gambar
//               fit: BoxFit.contain,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Text(
//                 'Visi & Misi UMSIDA',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue[900],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildFakultas(BuildContext context) {
//   return SizedBox(
//     width: 200, // atur lebar card
//     height: 200, // atur tinggi card
//     child: Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       clipBehavior: Clip.antiAlias,
//       child: InkWell(
//         onTap: () {
//           Navigator.pushNamed(context, '/fakultas');
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Image.asset(
//               'assets/images/logo2.png',
//               height: 120, // tinggi gambar
//               fit: BoxFit.contain,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Text(
//                 'Fakultas',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue[900],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildMenuUtama(BuildContext context) {
//   return Wrap(
//     alignment: WrapAlignment.center,
//     spacing: 16, // jarak horizontal
//     runSpacing: 16, // jarak vertikal kalau pindah baris
//     children: [_buildVisiMisi(context), _buildFakultas(context)],
//   );
// }

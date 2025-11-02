import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:readmore/readmore.dart';
import 'widgets/umsida_header.dart';
import 'widgets/umsida_menu_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isSambutanVisible = false; //ini untuk animasi saat scroll
  bool _isProfileVisible = false; //ini untuk animasi saat scroll
  bool _isStatistikVisible = false; //ini untuk animasi saat scroll

  final List<String> imagePaths = [ 
    'assets/images/pmbumsida2025.jpg',
    'assets/images/kampus1umsida.jpg',
    'assets/images/timimeiumsida.jpg',
    'assets/images/wisudaumsida.jpg',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
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
            const UmsidaHeader(), //pakai widget dari folder widgets
            const UmsidaMenuBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildImage(),
                    const SizedBox(height: 20),
                    _buildDeskripsi(context),
                    //sambutan Rektor
                    VisibilityDetector(
                      key: const Key('sambutan-rektor'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.3 && !_isSambutanVisible) {
                          setState(() {
                            _isSambutanVisible = true;
                          });
                        }
                      },
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: _isSambutanVisible ? 1 : 0),
                        duration: const Duration(milliseconds: 800),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(-100 * (1 - value), 0), // dari kanan
                            child: Opacity(opacity: value, child: child),
                          );
                        },
                        child: _buildSambutanrektor(context),
                      ),
                    ),

                    //profile Umsida
                    VisibilityDetector(
                      key: const Key('profile-umsida'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.3 && !_isProfileVisible) {
                          setState(() {
                            _isProfileVisible = true;
                          });
                        }
                      },
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: _isProfileVisible ? 1 : 0),
                        duration: const Duration(milliseconds: 800),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(-100 * (1 - value), 0), // dari kanan
                            child: Opacity(opacity: value, child: child),
                          );
                        },
                        // child: _buildProfileumsida(context),
                      ),
                    ),

                    Column(
                      children: [
                        const SizedBox(height: 20),
                        _buildStatistik(context),
                      ],
                    ),
                    // Tambahan konten sejarah
                    const SizedBox(height: 20),
                    _buildKontak(context),
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

  //INI ADALAH UNTUK GAMBAR YANG BERGERAK DI AWAL MENU HOME PAGE
  Widget _buildImage() {
    return SizedBox(
      height: 700,
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
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 60,
                  color: Colors.grey,
                );
              },
            ),
          );
        },
      ),
    );
  }
  //

  //INI UNTUK BAGIAN DESKRIPSI (TENTANG UMSIDA)
  Widget _buildDeskripsi(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.infinity, // card melebar penuh
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFFFFFFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Tentang UMSIDA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),

            // Ganti Text dengan ReadMoreText
            const ReadMoreText(
              'Universitas Muhammadiyah Sidoarjo (selanjutnya disebut UMSIDA) dengan semboyannya “Dari Sini Pencerahan Bersemi” termasuk salah satu universitas swasta di Jawa Timur yang berkomitmen menjadi salah satu perguruan tinggi unggul dan inovatif dalam pengembangan IPTEKS berdasarkan nilai-nilai Islam untuk kesejahteraan masyarakat di mana UMSIDA menjadi pusat pencerahan melalui pengembangan sumber daya manusia yang berorientasi pada iman, ilmu, dan amal serta pengembangan tradisi intelektual untuk mewujudkan masyarakat yang berkemajuan. UMSIDA akan terus berperan aktif dalam proses pembangunan nasional dengan melahirkan lulusan yang kompeten dan profesional di bidangnya, menguasai ilmu pengetahuan dan teknologi dengan dilandasi nilai- nilai keimanan dan akhak mulia. Harapannya, mereka menjadi insan yang mandiri, berwawasan luas, sadar akan keberadaannya dan bermanfaat bagi masyarakat Indonesia, serta ikhlas dan bersungguh-sungguh dalam melaksanakan tugas amar ma’ruf nahi munkar. Untuk mencapai cita tersebut, UMSIDA selanjutnya melaksanakan Catur Dharma Perguruan Tinggi yang mencakup pendidikan dan pengajaran, penelitian, pengabdian kepada masyarakat, dan pembinaan al-Islam dan Kemuhammadiyahan. \n '
              'UMSIDA di usianya yang ke-35 telah menunjukkan perkembangan yang cukup pesat. Jumlah program studi saat ini sebanyak 27 program studi dan terdapat penambahan 2 program studi baru di tahun 2019 ini yaitu Pendidikan Profesi Bidan (Sarjana Kebidanan dan Profesi Bidan) serta Fisioterapi (Diploma III). Jumlah fakultas dari yang awalnya 9 Fakultas berubah menjadi 5 Fakultas yaitu Fakultas Agama Islam, Fakultas Sains dan Teknologi (penggabungan Fakultas Teknik dan Fakultas Pertanian), Fakultas Bisnis Hukum dan Ilmu Sosial (penggabungan Fakultas Ekonomi dan Bisnis, Fakultas Hukum dan Fakultas Ilmu Sosial dan Ilmu Politik), Fakultas Psikologi dan Ilmu Pendidikan (penggabungan Fakultas Psikologi dan Fakultas Keguruan dan Ilmu Pendidikan). \n '
              'Sekitar 8972 mahasiswa kini tengah menempuh studi di masing-masing prodinya. Peringkat akreditasi institusi UMSIDA yaitu Unggul berdasarkan SK nomor 269/SK/BAN-PT/Ak/PT/III/2024. Hal ini merupakan suatu capaian dari komitmen sivitas akademika untuk memajukan lembaga. Hal ini diwujudkan UMSIDA melalui kerja keras meningkatkan pelayanan pendidikan tinggi yang memenuhi standar mutu baik aspek tenaga pendidik, layanan administrasi akademik, dan sarana-prasarana pendidikan.'
              'dan dukungan dosen berkualitas untuk mencetak lulusan yang berdaya saing tinggi ',
              trimLines: 2, // tampil 2 baris dulu
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Baca Selengkapnya',
              trimExpandedText: ' Tutup',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.black87,
              ),
              moreStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              lessStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }


// SAMBUTAN REKTOR
  Widget _buildSambutanrektor(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600; // breakpoint

            return isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/rektor.png',
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSambutanText(), // pisahkan teks ke widget biar rapi
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/rektor.png',
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(child: _buildSambutanText()),
                    ],
                  );
          },
        ),
      ),
    );
  }

//TEKS SAMBUTAN REKTOR
  Widget _buildSambutanText() {
    const sambutan = '''
Assalamu’alaikum Warahmatullahi Wabarakatuh,

Puji syukur kita panjatkan kehadirat Allah SWT, yang telah memberikan rahmat dan hidayah-Nya sehingga kita dapat berkumpul pada moment yang penuh berkah ini. Shalawat serta salam senantiasa tercurah kepada Rasulullah Muhammad SAW, keluarga, sahabat, dan umat Islam seluruhnya.

Saya, sebagai Rektor Universitas Muhammadiyah Sidoarjo, mengucapkan selamat datang kepada seluruh civitas akademika, mahasiswa, dosen, karyawan, dan stakeholder lainnya yang telah bergabung dalam perjalanan pendidikan di Universitas Muhammadiyah Sidoarjo.

Universitas Muhammadiyah Sidoarjo hadir sebagai lembaga pendidikan yang berkomitmen untuk memberikan pendidikan berkualitas dengan mengutamakan nilai-nilai keislaman, keilmuan, dan keberdayaan masyarakat. Kami percaya bahwa pendidikan adalah kunci untuk mewujudkan generasi yang unggul dan berdaya saing tinggi. Dalam era globalisasi ini, Universitas Muhammadiyah Sidoarjo berusaha untuk terus berkembang dan berinovasi demi memenuhi tuntutan zaman. Melalui program akademik yang beragam, fasilitas yang memadai, dan dukungan dosen yang berkualitas, kami berkomitmen untuk menciptakan lingkungan belajar yang inspiratif dan mendukung pengembangan potensi setiap mahasiswa. Tidak hanya fokus pada aspek akademis, kami juga menekankan pentingnya pengembangan karakter, kepemimpinan, dan keterampilan soft skills. Hal ini bertujuan untuk menciptakan lulusan yang tidak hanya kompeten secara profesional, tetapi juga memiliki integritas, etika, dan rasa tanggung jawab sosial yang tinggi.

Kami mengajak seluruh civitas akademika untuk bersama-sama berkontribusi dalam membangun atmosfer akademik yang dinamis, inklusif, dan harmonis. Mari kita jalin kerjasama dan solidaritas untuk mencapai visi dan misi Universitas Muhammadiyah Sidoarjo.

Terima kasih kepada seluruh pihak yang telah mendukung dan berperan aktif dalam perjalanan kami. Semoga Allah SWT senantiasa memberikan taufik dan hidayah-Nya, sehingga kita dapat terus berkarya dan memberikan manfaat bagi umat, bangsa, dan agama.

Wassalamu’alaikum Warahmatullahi Wabarakatuh.
''';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Sambutan Rektor',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 12),
        ReadMoreText(
          sambutan,
          trimLines: 7, // tampil 4 baris dulu
          trimMode: TrimMode.Line,
          trimCollapsedText: ' Baca Selengkapnya',
          trimExpandedText: ' Tutup',
          style: TextStyle(fontSize: 15, height: 1.6),
          textAlign: TextAlign.justify,
          moreStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          lessStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

//UNTUK BAGIAN STATISTIK (JUMLAH PRODI, FAKULTAS, WEBOMERIK)
  Widget _buildStatistik(BuildContext context) {
    return VisibilityDetector(
      key: const Key('statistik-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_isStatistikVisible) {
          setState(() {
            _isStatistikVisible = true;
          });
        }
      },
      child: AnimatedOpacity(
        opacity: _isStatistikVisible ? 1 : 0,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(height: 3, width: 80, color: Colors.amber),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  _animatedStatBox('Fakultas', 6),
                  _animatedStatBox('Program Studi', 27),
                  _animatedStatBox('Webometrik', 201),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _animatedStatBox(String title, int targetValue) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: _isStatistikVisible ? targetValue : 0),
      duration: const Duration(seconds: 7),
      builder: (context, value, child) {
        return _buildStatBox(title, value.toString());
      },
    );
  }

  Widget _buildStatBox(String title, String value) {
    return Container(
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 16, 105, 168),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(221, 255, 254, 254),
            ),
          ),
        ],
      ),
    );
  }

//UNTUK BAGIAN KONTAK
  Widget _buildKontak(BuildContext context) {
    return Card(
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
            _contactItem(Icons.location_on, 'Jl. Mojopahit 666B, Sidoarjo'),
            _contactItem(Icons.phone, '(031) 8945444'),
            _contactItem(Icons.email, 'info@umsida.ac.id'),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/kontak'),
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
    );
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
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/colors.dart';
import '../../core/providers/auth_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import 'detail_tugas_page.dart';
import 'materi_viewer_page.dart';
import 'video_player_page.dart';
import 'quiz_review_page.dart';

class DetailMataKuliahPage extends StatelessWidget {
  final Map<String, dynamic> course;

  DetailMataKuliahPage({required this.course});

  final String title1 = 'Pengantar User Interface Design';
  final String desc1 =
      'Materi pengantar ini akan membahas dasar-dasar User Interface Design, termasuk prinsip-prinsip desain yang baik, elemen-elemen UI, dan bagaimana menciptakan pengalaman pengguna yang intuitif. Peserta akan belajar tentang hierarki visual, konsistensi, dan feedback dalam desain antarmuka.';
  final List<Map<String, dynamic>> materials1 = [
    {'title': 'Zoom Meeting Syncronous', 'icon': Icons.link, 'available': true},
    {
      'title': 'Pengantar User Interface Design',
      'icon': Icons.description,
      'available': true,
    },
    {
      'title': 'Empat Teori Dasar Antarmuka Pengguna',
      'icon': Icons.picture_as_pdf,
      'available': true,
    },
    {
      'title': 'User Interface Design for Beginner',
      'icon': Icons.video_library,
      'available': true,
    },
    {'title': '20 Prinsip Desain', 'icon': Icons.image, 'available': true},
    {
      'title': 'Best Practice UI Design',
      'icon': Icons.article,
      'available': true,
    },
  ];

  final String title2 = 'Konsep User Interface Design';
  final String desc2 =
      'Materi ini membahas konsep-konsep dasar dalam User Interface Design, termasuk elemen-elemen antarmuka, panduan desain, dan prinsip-prinsip yang harus diperhatikan untuk menciptakan pengalaman pengguna yang optimal.';
  final List<Map<String, dynamic>> materials2 = [
    {'title': 'Zoom Meeting Syncronous', 'icon': Icons.link, 'available': true},
    {
      'title': 'Elemen-elemen Antarmuka Pengguna',
      'icon': Icons.description,
      'available': true,
    },
    {
      'title': 'UID Guidelines and Principles',
      'icon': Icons.picture_as_pdf,
      'available': true,
    },
    {'title': 'User Profile', 'icon': Icons.image, 'available': true},
    {
      'title': 'Principles of User Interface Design URL',
      'icon': Icons.link,
      'available': true,
    },
  ];

  final List<Map<String, dynamic>> tasks2 = [
    {
      'type': 'quiz',
      'title': 'Quiz Review 01',
      'icon': Icons.quiz,
      'description':
          'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan. Kerjakan sebelum hari Jumat, 26 Februari 2021 jam 23:59 WIB.',
      'available': true,
    },
    {
      'type': 'assignment',
      'title': 'Tugas 01 - UID Android Mobile Game',
      'icon': Icons.description,
      'description':
          '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan. 2. Desain yang dibuat harus meliputi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka.',
      'available': false,
    },
  ];

  final List<Map<String, dynamic>> meetings = [
    {
      'meeting': 'Pertemuan 1',
      'title': '01 - Pengantar User Interface Design',
      'status': 'completed',
      'footer': '3 URLs, 2 Files, 3 Interactive Content',
    },
    {
      'meeting': 'Pertemuan 2',
      'title': '02 - Konsep User Interface Design',
      'status': 'completed',
      'footer': '2 URLs, 1 File, 4 Tugas',
    },
    {
      'meeting': 'Pertemuan 3',
      'title': '03 - Wireframing dan Prototyping',
      'status': 'in_progress',
      'footer': '4 URLs, 3 Files, 2 Interactive Content',
    },
    {
      'meeting': 'Pertemuan 4',
      'title': '04 - User Research',
      'status': 'not_started',
      'footer': '1 URL, 2 Files, 5 Interactive Content',
    },
  ];

  final List<Map<String, dynamic>> tasks = [
    {
      'meeting': 'Pertemuan 1',
      'title': 'Tugas Minggu 1',
      'status': 'completed',
      'footer': '1 Assignment | Closed: Saturday, 12 June 2021, 23:59',
    },
    {
      'meeting': 'Pertemuan 2',
      'title': 'Kuis Pengantar UI',
      'status': 'completed',
      'footer': '1 Quiz | Closed: Saturday, 19 June 2021, 23:59',
    },
    {
      'meeting': 'Pertemuan 3',
      'title': 'Tugas Wireframing',
      'status': 'in_progress',
      'footer': '1 Assignment | Closed: Saturday, 26 June 2021, 23:59',
    },
    {
      'meeting': 'Pertemuan 4',
      'title': 'Kuis User Research',
      'status': 'not_started',
      'footer': '1 Quiz | Closed: Saturday, 3 July 2021, 23:59',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;
    final shortName = user?.email != null ? user!.email.split('@')[0] : 'USER';

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            // Header Merah
            Container(
              color: AppColors.primaryRed,
              padding: EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      '${course['subject']} D4SM-42-03 [$shortName]',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            // Tab Area
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Materi'),
                  Tab(text: 'Tugas Dan Kuis'),
                ],
              ),
            ),
            // Tab Content
            Expanded(
              child: TabBarView(
                children: [
                  // Materi Tab
                  ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: meetings.length,
                    itemBuilder: (context, index) {
                      final meeting = meetings[index];
                      return _buildMeetingCard(context, meeting);
                    },
                  ),
                  // Tugas Dan Kuis Tab
                  tasks2.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/free.png',
                                width: 200,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Tidak Ada Tugas Dan Kuis Hari Ini',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quiz - Assessments 2',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 16),
                              Expanded(
                                child: ListView(
                                  children: tasks2
                                      .map(
                                        (item) =>
                                            _buildTaskQuizItem(context, item),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Assuming Kelas Saya is index 1
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  void _showMateriDetailBottomSheet(
    BuildContext context,
    String title,
    String description,
    List<Map<String, dynamic>> materials,
    List<Map<String, dynamic>> tasks,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.25,
        maxChildSize: 0.85,
        builder: (context, scrollController) => DefaultTabController(
          length: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                // Drag handle
                Container(
                  margin: EdgeInsets.only(top: 8),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(),
                // Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(color: Colors.grey[700], height: 1.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Tabs
                TabBar(
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Lampiran Materi'),
                    Tab(text: 'Tugas dan Kuis'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Lampiran Materi
                      ListView(
                        controller: scrollController,
                        padding: EdgeInsets.all(16),
                        children: materials
                            .map((item) => _buildMateriItem(context, item))
                            .toList(),
                      ),
                      // Tugas dan Kuis
                      tasks.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/free.png',
                                    width: 200,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Tidak Ada Tugas Dan Kuis Hari Ini',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : ListView(
                              controller: scrollController,
                              padding: EdgeInsets.all(16),
                              children: tasks
                                  .map(
                                    (item) => _buildTaskQuizItem(context, item),
                                  )
                                  .toList(),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMateriItem(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: item['title'] == 'Pengantar User Interface Design'
          ? () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MateriViewerPage()),
            )
          : item['title'] == 'User Interface Design for Beginner'
          ? () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoPlayerPage()),
            )
          : null,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(item['icon'], color: Colors.blue),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                item['title'],
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Icon(
              item['available']
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: item['available'] ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskQuizItem(BuildContext context, Map<String, dynamic> item) {
    Widget card = Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(item['icon'], color: Colors.blue),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item['description'],
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                ],
              ),
            ),
            Icon(
              item['available']
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: item['available'] ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );

    if (item['type'] == 'assignment') {
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailTugasPage()),
        ),
        child: card,
      );
    } else if (item['type'] == 'quiz') {
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizReviewPage()),
        ),
        child: card,
      );
    }
    return card;
  }

  Widget _buildMeetingCard(BuildContext context, Map<String, dynamic> meeting) {
    IconData statusIcon;
    Color iconColor;
    if (meeting['status'] == 'completed') {
      statusIcon = Icons.check_circle;
      iconColor = Colors.green;
    } else if (meeting['status'] == 'in_progress') {
      statusIcon = Icons.radio_button_unchecked;
      iconColor = Colors.grey;
    } else {
      statusIcon = Icons.radio_button_unchecked;
      iconColor = Colors.grey;
    }

    return GestureDetector(
      onTap: () {
        String title, desc;
        List<Map<String, dynamic>> mats;
        List<Map<String, dynamic>> tsks = [];
        if (meeting['meeting'] == 'Pertemuan 1') {
          title = title1;
          desc = desc1;
          mats = materials1;
          tsks = [];
        } else if (meeting['meeting'] == 'Pertemuan 2') {
          title = title2;
          desc = desc2;
          mats = materials2;
          tsks = tasks2;
        } else {
          return;
        }
        _showMateriDetailBottomSheet(context, title, desc, mats, tsks);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20), // Space for badge
                Center(
                  child: Text(
                    meeting['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  meeting['footer'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            // Badge
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  meeting['meeting'],
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
            // Status Icon
            Positioned(
              top: 0,
              right: 0,
              child: Icon(statusIcon, color: iconColor, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'main_screen.dart';
import 'detail_pengumuman_page.dart';

class PengumumanPage extends StatelessWidget {
  final List<Map<String, String>> announcements = [
    {
      'title': 'Maintenance Pra UAS Semester Genap 2020/2021',
      'subtitle': 'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
    },
    {
      'title': 'Update Sistem LMS',
      'subtitle': 'By Admin Celoe - Kamis, 3 Juni 2021, 14:30',
    },
    {
      'title': 'Pengumuman Libur Nasional',
      'subtitle': 'By Admin Celoe - Jumat, 4 Juni 2021, 09:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Pengumuman',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final ann = announcements[index];
          final isTappable = index == 0; // Only first announcement is tappable
          return GestureDetector(
            onTap: isTappable
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPengumumanPage(),
                      ),
                    );
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.campaign, color: Colors.black, size: 30),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ann['title']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          ann['subtitle']!,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: -1,
        onTap: (index) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => MainScreen(initialIndex: index),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'main_screen.dart';

class DetailPengumumanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Pengumuman',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Maintenance Pra UAS Semester Genap 2020/2021',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey, radius: 15),
                SizedBox(width: 10),
                Text(
                  'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/lms.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Maintenance LMS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Kami informasikan bahwa sistem Learning Management System (LMS) akan mengalami maintenance pada tanggal 5 Juni 2021 mulai pukul 22:00 WIB hingga 6 Juni 2021 pukul 06:00 WIB. Selama periode maintenance, akses ke LMS akan tidak dapat dilakukan.\n\nMaintenance ini dilakukan untuk meningkatkan performa sistem dan memperbaiki beberapa bug yang ada. Kami mohon maaf atas ketidaknyamanan yang timbul.\n\nUntuk informasi lebih lanjut, silakan hubungi admin melalui email admin@telkomuniversity.ac.id.\n\nTerima kasih atas perhatian dan pengertiannya.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            Text(
              'Hormat Kami,\nCeLOE Telkom University',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
          ],
        ),
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

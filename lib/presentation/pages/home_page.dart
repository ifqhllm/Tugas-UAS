import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/colors.dart';
import '../../core/providers/auth_provider.dart';
import 'profile_page.dart';
import 'pengumuman_page.dart';
import 'detail_pengumuman_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> courses = [
    {
      'image': 'assets/1.png',
      'yearSemester': '2021/2',
      'subject': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'code': 'DP01',
      'progress': 89,
    },
    {
      'image': 'assets/2.jpg',
      'yearSemester': '2021/2',
      'subject': 'KEWARGANEGARAAN',
      'code': 'KW02',
      'progress': 75,
    },
    {
      'image': 'assets/3.jpg',
      'yearSemester': '2021/2',
      'subject': 'SISTEM OPERASI',
      'code': 'SO03',
      'progress': 60,
    },
    {
      'image': 'assets/4.jpg',
      'yearSemester': '2021/2',
      'subject': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
      'code': 'PM04',
      'progress': 45,
    },
    {
      'image': 'assets/5.jpg',
      'yearSemester': '2021/2',
      'subject': 'BAHASA INGGRIS:BUSSINES AND SCIENTIFIC',
      'code': 'BI01',
      'progress': 75,
    },
    {
      'image': 'assets/6.jpg',
      'yearSemester': '2021/2',
      'subject': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
      'code': 'PM02',
      'progress': 60,
    },
    {
      'image': 'assets/7.jpg',
      'yearSemester': '2021/2',
      'subject': 'OLAH RAGA',
      'code': 'OR03',
      'progress': 45,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            color: AppColors.primaryRed,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'HALLO, ${user?.name ?? 'USER'}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'MAHASISWA',
                        style: TextStyle(
                          color: AppColors.primaryRed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          user?.profileImageUrl ?? 'assets/logo tel.png',
                        ),
                        radius: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card Tugas Utama
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tugas Yang Akan Datang',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          'Nama Tugas: Prototype Aplikasi Mobile',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          'Waktu Pengumpulan: 15 Desember 2023, 23:59',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Section Pengumuman
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pengumuman Terakhir',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PengumumanPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Lihat Semua',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPengumumanPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/lms.png', width: 50, height: 50),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Maintenance LMS',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Progres Kelas
                  Text(
                    'Progres Kelas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: courses
                        .map((course) => _buildCourseCard(course))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> course) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              course['image'],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course['yearSemester'],
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  course['subject'].toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(course['code'], style: TextStyle(fontSize: 12)),
                SizedBox(height: 10),
                Container(
                  height: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: course['progress'] / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primaryRed,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${course['progress']} % Selesai',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

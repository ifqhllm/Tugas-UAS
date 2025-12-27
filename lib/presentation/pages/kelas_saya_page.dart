import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import 'detail_mata_kuliah_page.dart';

class KelasSayaPage extends StatelessWidget {
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Kelas Saya',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Material(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMataKuliahPage(course: course),
                  ),
                );
              },
              child: Container(
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
                        height: 60,
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(course['code'], style: TextStyle(fontSize: 12)),
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: LinearProgressIndicator(
                              value: course['progress'] / 100,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primaryRed,
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
              ),
            ),
          );
        },
      ),
    );
  }
}

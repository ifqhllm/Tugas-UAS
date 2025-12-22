import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class KelasSayaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Kelas Saya', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildClassItem(
            image: 'lib/assets/lms.png',
            yearSemester: '2023/2024 - Ganjil',
            subject: 'Desain Antarmuka & Pengalaman Pengguna',
            code: 'DP01',
            schedule: 'Senin, 08:00 - 10:00',
            progress: 89,
          ),
          SizedBox(height: 20),
          _buildClassItem(
            image: 'lib/assets/lms.png',
            yearSemester: '2023/2024 - Ganjil',
            subject: 'Pemrograman Mobile',
            code: 'PM02',
            schedule: 'Rabu, 10:00 - 12:00',
            progress: 75,
          ),
          // Add more items as needed
        ],
      ),
    );
  }

  Widget _buildClassItem({
    required String image,
    required String yearSemester,
    required String subject,
    required String code,
    required String schedule,
    required int progress,
  }) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(image, width: 50, height: 50),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  yearSemester,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(subject, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Kode Kelas: $code', style: TextStyle(fontSize: 12)),
                Text('Jadwal: $schedule', style: TextStyle(fontSize: 12)),
                SizedBox(height: 10),
                LinearProgressIndicator(
                  value: progress / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primaryRed,
                  ),
                ),
                SizedBox(height: 5),
                Text('$progress% Selesai', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

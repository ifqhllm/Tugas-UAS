import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class NotifikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Notifikasi', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildNotificationItem(
            icon: Icons.description,
            message:
                'Anda telah mengirimkan pengajuan tugas "Prototype Aplikasi Mobile" untuk mata kuliah Desain Antarmuka & Pengalaman Pengguna.',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          SizedBox(height: 15),
          _buildNotificationItem(
            icon: Icons.quiz,
            message:
                'Kuis "Pengenalan UI/UX" telah dibuka. Silakan kerjakan sebelum batas waktu.',
            time: '1 Hari 5 Jam Yang Lalu',
          ),
          // Add more items
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String message,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 30, color: AppColors.primaryRed),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message, style: TextStyle(fontSize: 14)),
              SizedBox(height: 5),
              Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}

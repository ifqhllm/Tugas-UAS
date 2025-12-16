import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class CourseDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Mata Kuliah"),
        backgroundColor: AppColors.primaryRed,
      ),
      body: Column(
        children: [
          // Banner Video/Gambar Mata Kuliah
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.black87,
            child: Center(
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Text(
                  "User Experience Design",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Dosen: Dr. Nama Dosen",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Divider(height: 30),
                Text(
                  "Daftar Modul",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildModuleTile("Minggu 1: Pengenalan UX", true),
                _buildModuleTile("Minggu 2: Design Thinking", true),
                _buildModuleTile("Minggu 3: Wireframing", false),
                _buildModuleTile("Minggu 4: Prototyping", false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleTile(String title, bool isCompleted) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isCompleted ? Colors.green : Colors.grey,
      ),
      title: Text(title),
      trailing: Icon(Icons.download_rounded, size: 20),
    );
  }
}

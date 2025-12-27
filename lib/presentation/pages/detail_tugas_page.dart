import 'package:flutter/material.dart';

class DetailTugasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB71C1C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Tugas 01 - UID Android Mobile Game',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Description
            Text(
              '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.\n\n2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.\n\n3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.\n\n4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.\n\n5. File dikumpulkan dalam format .PDF dengan size maksimal 5MB.\n\n6. Tugas dikumpulkan paling lambat hari Jum\'at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.',
              style: TextStyle(color: Color(0xFF333333), height: 1.5),
            ),
            SizedBox(height: 24),
            // Status Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xFFEF6C6C),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Status Tugas',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildStatusRow(
                          'Status',
                          'Sudah Mengirim untuk di nilai',
                        ),
                        Divider(),
                        _buildStatusRow('Status Nilai', 'Belum Di nilai'),
                        Divider(),
                        _buildStatusRow(
                          'Batas tanggal',
                          'Jumat, 26 Februari 2021, 23:59 WIB',
                        ),
                        Divider(),
                        _buildStatusRow(
                          'Sisa Waktu',
                          'Tugas sudah di kirim 4 Hari 6 Jam Sebelumnya',
                        ),
                        Divider(),
                        Row(
                          children: [
                            Text(
                              'File Tugas',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Spacer(),
                            Icon(Icons.insert_drive_file, color: Colors.grey),
                            SizedBox(width: 8),
                            Text(
                              'Tugas_UID_Android.pdf',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () => _showUploadBottomSheet(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text(
                  'Tambahkan Tugas',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Spacer(),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  void _showUploadBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.25,
        maxChildSize: 0.6,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // Drag indicator
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xFFB71C1C),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Upload File',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Maksimum File 5MB, Maksimum Jumlah File 20',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload,
                              color: Colors.blue,
                              size: 48,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'File yang akan di upload akan tampil di sini',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Pilih File'),
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          shape: StadiumBorder(),
                        ),
                        child: Text('Simpan'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

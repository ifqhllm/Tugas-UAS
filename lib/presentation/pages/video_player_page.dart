import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set status bar color to match header
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF800000), // Dark maroon
        statusBarIconBrightness: Brightness.light,
      ),
    );

    final List<Map<String, dynamic>> otherVideos = [
      {'thumbnail': 'assets/yt1.jpg', 'title': 'Interaction Design'},
      {
        'thumbnail': 'assets/yt2.jpg',
        'title': 'Pengantar Desain Antarmuka Pengguna',
      },
      {
        'thumbnail': 'assets/yt3.jpg',
        'title': '4 Teori Dasar Design Antarmuka pengguna',
      },
      {
        'thumbnail': 'assets/yt4.jpg',
        'title': 'Tutorial Dasar Figma – UI/UX Design Software',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF800000), // Dark maroon
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Video - User Interface Design For Beginner',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Main Video Player
            Image.asset(
              'assets/yt.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(height: 16),
            // Section Title
            const Text(
              'Video Lain Nya',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // List of Other Videos
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: otherVideos.length,
              itemBuilder: (context, index) {
                final video = otherVideos[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.grey[100] : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        video['thumbnail'],
                        width: 80,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          video['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

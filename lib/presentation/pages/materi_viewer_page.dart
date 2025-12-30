import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MateriViewerPage extends StatelessWidget {
  const MateriViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set status bar color to match header
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF800000), // Dark maroon
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF800000), // Dark maroon
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Pengantar User Interface Design',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600, // Semi-bold
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Text(
              'Halaman 1/26',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageWithSeparator('assets/ss1.jpg'),
            _buildImageWithSeparator('assets/ss2.jpg'),
            _buildImageWithSeparator('assets/ss3.jpg'),
            _buildImageWithSeparator('assets/ss4.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithSeparator(String assetPath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Image.asset(
        assetPath,
        fit: BoxFit.fitWidth,
        width: double.infinity,
      ),
    );
  }
}

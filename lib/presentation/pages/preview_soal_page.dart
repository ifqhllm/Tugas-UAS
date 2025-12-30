import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreviewSoalPage extends StatelessWidget {
  final int questionIndex;
  final String selectedAnswer;
  final Map<String, dynamic> question;

  const PreviewSoalPage({
    super.key,
    required this.questionIndex,
    required this.selectedAnswer,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF800000),
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF800000),
        title: const Text(
          'Quiz Review 1',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(Icons.access_time, color: Colors.white),
                const SizedBox(width: 8),
                const Text(
                  '15:00',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Numbers
            Wrap(
              spacing: 8.0,
              children: List.generate(15, (index) {
                return Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            // Question Content
            Text(
              'Soal Nomor ${questionIndex + 1} / 15',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(question['question'], style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            // Options
            ...(question['options'] as List<String>).map<Widget>((option) {
              bool isSelected = option.startsWith(selectedAnswer);
              return Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.pinkAccent : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: isSelected
                      ? [const BoxShadow(color: Colors.grey, blurRadius: 4.0)]
                      : null,
                ),
                child: Text(option, style: const TextStyle(fontSize: 16)),
              );
            }).toList(),
            const SizedBox(height: 32),
            // Navigation Button
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text('Kembali Ke Halam Review'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

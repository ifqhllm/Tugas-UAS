import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'quiz_review_page.dart';
import 'preview_soal_page.dart';

class ReviewAnswersPage extends StatelessWidget {
  final List<String?> selectedAnswers;
  final List<Map<String, dynamic>> questions;

  const ReviewAnswersPage({
    super.key,
    required this.selectedAnswers,
    required this.questions,
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
          'Review Jawaban',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // No back button
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Summary Card
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                children: [
                  _buildTableRow(
                    'Di Mulai Pada',
                    'Kamis, 25 Februari 2021 10:25',
                  ),
                  _buildTableRow('Status', 'Selesai'),
                  _buildTableRow(
                    'Selesai Pada',
                    'Kamis, 25 Februari 2021 10:40',
                  ),
                  _buildTableRow('Waktu Penyelesaian', '13 Menit 22 Detik'),
                  _buildTableRow('Nilai', '85 / 100'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Questions List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final selected = selectedAnswers[index];
                final selectedOption = (question['options'] as List<String>)
                    .firstWhere(
                      (String opt) => opt.startsWith(selected ?? ''),
                      orElse: () => 'Tidak ada jawaban',
                    );
                return Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pertanyaan ${index + 1}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(question['question']),
                            ),
                            const SizedBox(height: 8),
                            Text('Jawaban Tersimpan: $selectedOption'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PreviewSoalPage(
                                      questionIndex: index,
                                      selectedAnswer: selected ?? '',
                                      question: question,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Lihat Soal',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizReviewPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text('Kirim Jawaban'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(value),
        ),
      ],
    );
  }
}

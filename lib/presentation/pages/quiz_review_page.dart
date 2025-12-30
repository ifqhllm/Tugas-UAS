import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'interactive_quiz_page.dart';
import 'review_answers_page.dart';

class QuizReviewPage extends StatefulWidget {
  const QuizReviewPage({super.key});

  @override
  _QuizReviewPageState createState() => _QuizReviewPageState();
}

class _QuizReviewPageState extends State<QuizReviewPage> {
  bool quizCompleted = false;
  List<String?> savedAnswers = [];

  @override
  void initState() {
    super.initState();
    _loadQuizData();
  }

  Future<void> _loadQuizData() async {
    final prefs = await SharedPreferences.getInstance();
    final completed = prefs.getBool('quiz_completed') ?? false;
    if (completed) {
      final answers = prefs.getStringList('quiz_answers') ?? [];
      setState(() {
        quizCompleted = true;
        savedAnswers = answers.map((e) => e.isEmpty ? null : e).toList();
      });
    }
  }

  // Sample data for review
  static const List<Map<String, dynamic>> sampleQuestions = [
    {
      'question': 'Radio button dapat digunakan untuk menentukan...',
      'options': [
        'A. Jenis Kelamin',
        'B. Pilihan Warna',
        'C. Tanggal Lahir',
        'D. Alamat Email',
        'E. Nomor Telepon',
      ],
    },
    {
      'question': 'Apa fungsi utama dari checkbox dalam form?',
      'options': [
        'A. Input teks',
        'B. Pilihan tunggal',
        'C. Pilihan ganda',
        'D. Upload file',
        'E. Validasi',
      ],
    },
    {
      'question': 'Pertanyaan 3',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 4',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 5',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 6',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 7',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 8',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 9',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 10',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 11',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 12',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 13',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 14',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
    {
      'question': 'Pertanyaan 15',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
    },
  ];

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
          'Quiz Review 1',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Instructions
            const Text(
              'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan. Kerjakan sebelum hari Jum\'at, 26 Februari 2021 jam 23:59 WIB.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16),
            // Quiz Info Card
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Kuis Akan di tutup pada Jumat, 26 February 2021, 11:59 PM',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Batas Waktu: 15 menit',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Metode Penilaian: Nilai Tertinggi',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Attempts Section
            const Text(
              'Percobaan Yang Sudah Di Lakukan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Table
            Table(
              border: TableBorder.all(color: Colors.grey[300]!),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: [
                // Header
                TableRow(
                  decoration: const BoxDecoration(color: Colors.pinkAccent),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Status',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Nilai / 100.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Tinjau Kembali',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                // Data Row
                TableRow(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.grey[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quizCompleted ? 'Selesai' : 'Belum Dikerjakan',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            quizCompleted
                                ? 'Dikirim Pada Kamis, 25 Februari 2021, 10:40'
                                : 'Belum ada percobaan',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.grey[50],
                      child: Text(
                        quizCompleted ? '85,0' : '-',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.grey[50],
                      child: TextButton(
                        onPressed: quizCompleted
                            ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReviewAnswersPage(
                                    selectedAnswers: savedAnswers,
                                    questions: sampleQuestions,
                                  ),
                                ),
                              )
                            : null,
                        child: Text(
                          'Lihat',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: quizCompleted ? Colors.blue : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Final Score
            if (quizCompleted)
              const Text(
                'Nilai Akhir Anda Untuk Kuis Ini Adalah 85.0 / 100.00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 32),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InteractiveQuizPage(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Ambil Kuis'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Kembali Ke Kelas'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

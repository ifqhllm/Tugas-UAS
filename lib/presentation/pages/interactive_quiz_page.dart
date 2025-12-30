import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'review_answers_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InteractiveQuizPage extends StatefulWidget {
  const InteractiveQuizPage({super.key});

  @override
  _InteractiveQuizPageState createState() => _InteractiveQuizPageState();
}

class _InteractiveQuizPageState extends State<InteractiveQuizPage> {
  int currentIndex = 0;
  List<String?> selectedAnswers = List.filled(15, null);
  List<bool> answered = List.filled(15, false);

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Radio button dapat digunakan untuk menentukan...',
      'options': [
        'A. Jenis Kelamin',
        'B. Pilihan Warna',
        'C. Tanggal Lahir',
        'D. Alamat Email',
        'E. Nomor Telepon',
      ],
      'correct': 'A',
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
      'correct': 'C',
    },
    // Add more questions up to 15
    {
      'question': 'Pertanyaan 3',
      'options': [
        'A. Opsi A',
        'B. Opsi B',
        'C. Opsi C',
        'D. Opsi D',
        'E. Opsi E',
      ],
      'correct': 'B',
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
      'correct': 'C',
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
      'correct': 'D',
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
      'correct': 'E',
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
      'correct': 'A',
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
      'correct': 'B',
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
      'correct': 'C',
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
      'correct': 'D',
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
      'correct': 'E',
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
      'correct': 'A',
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
      'correct': 'B',
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
      'correct': 'C',
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
      'correct': 'D',
    },
  ];

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
            // Timer Section
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.access_time, color: Colors.black),
                const SizedBox(width: 8),
                const Text(
                  '15:00',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Question Numbers
            Wrap(
              spacing: 8.0,
              children: List.generate(15, (index) {
                bool isCurrent = index == currentIndex;
                bool isAnswered = answered[index];
                return Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isCurrent || isAnswered
                        ? Colors.green
                        : Colors.white,
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: isCurrent || isAnswered
                            ? Colors.white
                            : Colors.black,
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
              'Soal Nomor ${currentIndex + 1} / 15',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              questions[currentIndex]['question'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            // Options
            ...questions[currentIndex]['options'].map<Widget>((option) {
              bool isSelected = selectedAnswers[currentIndex] == option[0];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAnswers[currentIndex] = option[0];
                    answered[currentIndex] = true;
                  });
                },
                child: Container(
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
                ),
              );
            }).toList(),
            const SizedBox(height: 32),
            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentIndex--;
                      });
                    },
                    child: const Text('Soal Sebelumnya'),
                  )
                else
                  const SizedBox(),
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex < 14) {
                      setState(() {
                        currentIndex++;
                      });
                    } else {
                      _showFinishDialog();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: currentIndex == 14 ? Colors.green : null,
                  ),
                  child: Text(
                    currentIndex == 14 ? 'Selesai' : 'Soal Selanjutnya',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showFinishDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda yakin ingin menyelesaikan kuis?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final prefs = await SharedPreferences.getInstance();
              await prefs.setStringList(
                'quiz_answers',
                selectedAnswers.map((e) => e ?? '').toList(),
              );
              await prefs.setBool('quiz_completed', true);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewAnswersPage(
                    selectedAnswers: selectedAnswers,
                    questions: questions,
                  ),
                ),
              );
            },
            child: const Text('Ya, Selesai'),
          ),
        ],
      ),
    );
  }
}

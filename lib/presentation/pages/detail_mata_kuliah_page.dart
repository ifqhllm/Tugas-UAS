import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/colors.dart';
import '../../core/providers/auth_provider.dart';
import '../widgets/bottom_nav_bar.dart';

class DetailMataKuliahPage extends StatelessWidget {
  final Map<String, dynamic> course;

  DetailMataKuliahPage({required this.course});

  final List<Map<String, dynamic>> meetings = [
    {
      'meeting': 'Pertemuan 1',
      'title': '01 - Pengantar User Interface Design',
      'status': 'completed',
      'footer': '3 URLs, 2 Files, 3 Interactive Content',
    },
    {
      'meeting': 'Pertemuan 2',
      'title': '02 - Prinsip Desain UI',
      'status': 'completed',
      'footer': '2 URLs, 1 File, 4 Interactive Content',
    },
    {
      'meeting': 'Pertemuan 3',
      'title': '03 - Wireframing dan Prototyping',
      'status': 'in_progress',
      'footer': '4 URLs, 3 Files, 2 Interactive Content',
    },
    {
      'meeting': 'Pertemuan 4',
      'title': '04 - User Research',
      'status': 'not_started',
      'footer': '1 URL, 2 Files, 5 Interactive Content',
    },
  ];

  final List<Map<String, dynamic>> tasks = [
    {
      'meeting': 'Pertemuan 1',
      'title': 'Tugas Minggu 1',
      'status': 'completed',
      'footer': '1 Assignment | Closed: Saturday, 12 June 2021, 23:59',
    },
    {
      'meeting': 'Pertemuan 2',
      'title': 'Kuis Pengantar UI',
      'status': 'completed',
      'footer': '1 Quiz | Closed: Saturday, 19 June 2021, 23:59',
    },
    {
      'meeting': 'Pertemuan 3',
      'title': 'Tugas Wireframing',
      'status': 'in_progress',
      'footer': '1 Assignment | Closed: Saturday, 26 June 2021, 23:59',
    },
    {
      'meeting': 'Pertemuan 4',
      'title': 'Kuis User Research',
      'status': 'not_started',
      'footer': '1 Quiz | Closed: Saturday, 3 July 2021, 23:59',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;
    final shortName = user?.email != null ? user!.email.split('@')[0] : 'USER';

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            // Header Merah
            Container(
              color: AppColors.primaryRed,
              padding: EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      '${course['subject']} D4SM-42-03 [$shortName]',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            // Tab Area
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Materi'),
                  Tab(text: 'Tugas Dan Kuis'),
                ],
              ),
            ),
            // Tab Content
            Expanded(
              child: TabBarView(
                children: [
                  // Materi Tab
                  ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: meetings.length,
                    itemBuilder: (context, index) {
                      final meeting = meetings[index];
                      return _buildMeetingCard(meeting);
                    },
                  ),
                  // Tugas Dan Kuis Tab
                  Center(child: Text('Tugas Dan Kuis Content')),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Assuming Kelas Saya is index 1
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildMeetingCard(Map<String, dynamic> meeting) {
    IconData statusIcon;
    Color iconColor;
    if (meeting['status'] == 'completed') {
      statusIcon = Icons.check_circle;
      iconColor = Colors.green;
    } else if (meeting['status'] == 'in_progress') {
      statusIcon = Icons.radio_button_unchecked;
      iconColor = Colors.grey;
    } else {
      statusIcon = Icons.radio_button_unchecked;
      iconColor = Colors.grey;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // Space for badge
              Center(
                child: Text(
                  meeting['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Text(
                meeting['footer'],
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          // Badge
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                meeting['meeting'],
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
          // Status Icon
          Positioned(
            top: 0,
            right: 0,
            child: Icon(statusIcon, color: iconColor, size: 24),
          ),
        ],
      ),
    );
  }
}

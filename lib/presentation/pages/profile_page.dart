import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/colors.dart';
import '../../core/providers/auth_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import 'kelas_saya_page.dart';
import 'notifikasi_page.dart';
import 'main_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedTab = 'About Me';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.red, width: 2),
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  user?.profileImageUrl ??
                                      'lib/assets/logo tel.png',
                                ),
                                radius: 40,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              user?.email.toUpperCase() ?? 'USER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 48), // Spacer untuk balance
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -40),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Tabs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTab('About Me'),
                        _buildTab('Kelas'),
                        _buildTab('Edit Profile'),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _buildTabContent(),
            Padding(padding: EdgeInsets.only(bottom: 100)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KelasSayaPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotifikasiPage()),
            );
          }
          // for 3, do nothing
        },
      ),
    );
  }

  Widget _buildTab(String tabName) {
    bool isSelected = selectedTab == tabName;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tabName;
        });
      },
      child: Column(
        children: [
          Text(
            tabName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.primaryRed : Colors.grey,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 60,
              color: AppColors.primaryRed,
            ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case 'About Me':
        return _buildAboutMeContent();
      case 'Kelas':
        return _buildKelasContent();
      case 'Edit Profile':
        return _buildEditProfileContent();
      default:
        return Container();
    }
  }

  Widget _buildAboutMeContent() {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informasi User',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        _buildInfoRow('Email', user?.email ?? ''),
        _buildInfoRow('Program Studi', 'Teknik Informatika'),
        _buildInfoRow('Fakultas', 'Fakultas Teknik'),
        SizedBox(height: 20),
        Text(
          'Aktivitas Login',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('Terakhir login: ${DateTime.now().toString().split(' ')[0]}'),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildKelasContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kelas Saya',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              List<Map<String, String>> classes = [
                {
                  'title': 'UI/UX Design',
                  'code': 'IF-101',
                  'date': '2023-12-01',
                },
                {
                  'title': 'Mobile Development',
                  'code': 'IF-102',
                  'date': '2023-12-05',
                },
                {
                  'title': 'Database Systems',
                  'code': 'IF-103',
                  'date': '2023-12-10',
                },
              ];
              var cls = classes[index];
              return Row(
                children: [
                  _buildClassCard(cls['title']!, cls['code']!, cls['date']!),
                  if (index < 2) SizedBox(width: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildClassCard(String title, String code, String date) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.book, color: Colors.blue[300], size: 20),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(code, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          SizedBox(height: 5),
          Text(
            'Mulai: $date',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildEditProfileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Edit Profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _buildTextField('Nama Pertama', 'Masukkan nama pertama'),
        SizedBox(height: 15),
        _buildTextField('Nama Terakhir', 'Masukkan nama terakhir'),
        SizedBox(height: 15),
        _buildTextField('E-mail Address', 'Masukkan email'),
        SizedBox(height: 15),
        _buildTextField('Negara', 'Masukkan negara'),
        SizedBox(height: 15),
        _buildTextField('Deskripsi', 'Masukkan deskripsi'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement save functionality
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryRed,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Simpan Perubahan',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder untuk Logo CeLoe/Telkom
            Image.network(
              'https://upload.wikimedia.org/wikipedia/id/0/03/Logo_Telkom_University_potrait.png',
              height: 120,
            ),
            SizedBox(height: 40),
            Text(
              "Welcome to CeLoe",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryRed,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Learning Management System",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: "Username/Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Navigasi ke HomePage
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

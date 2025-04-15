import 'package:flutter/material.dart';
import 'package:cipherschools_flutter_assignment/Signup _login page/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

User? user = FirebaseAuth.instance.currentUser;
String? userName = user?.displayName;

class ProfilePage extends StatelessWidget {
  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();

    // Navigate to Signup/Login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Singup()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.purple,
                  child: CircleAvatar(
                    radius: 33,
                    backgroundImage: AssetImage('assets/google1.png'),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username', style: TextStyle(color: Colors.grey)),
                    Text(
                      userName != null ? userName! : "No Name",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.edit, size: 18),
                ),
              ],
            ),
            SizedBox(height: 40),
            buildMenuTile(Icons.account_balance_wallet_rounded, 'Account', Color(0xFF8B36F9).withOpacity(0.1)),
            buildMenuTile(Icons.settings, 'Settings', Color(0xFF8B36F9).withOpacity(0.1)),
            buildMenuTile(Icons.upload, 'Export Data', Color(0xFF8B36F9).withOpacity(0.1)),

            // ✅ Logout tile with onTap
            GestureDetector(
              onTap: () => signOut(context),
              child: buildMenuTile(
                Icons.logout,
                'Logout',
                Colors.redAccent.withOpacity(0.1),
                iconColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuTile(IconData icon, String label, Color bgColor,
      {Color iconColor = const Color(0xFF8B36F9)}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          SizedBox(width: 16),
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

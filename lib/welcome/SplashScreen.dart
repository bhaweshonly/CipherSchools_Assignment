import 'dart:async';
import 'package:cipherschools_flutter_assignment/welcome/WelcomeCipher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
const MaterialColor customPurple = MaterialColor(
  0xFF5E3EE7,
  <int, Color>{
    50: Color(0xFFE9E4FB),
    100: Color(0xFFC9BFF3),
    200: Color(0xFFA498EA),
    300: Color(0xFF7E70E2),
    400: Color(0xFF654FE0),
    500: Color(0xFF5E3EE7), // Main color
    600: Color(0xFF4F35CD),
    700: Color(0xFF402DB2),
    800: Color(0xFF322498),
    900: Color(0xFF241C7D),
  },
);
class SplashScreen extends StatefulWidget {
  @override

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: customPurple.shade300,
        ),
        child: Stack(
          children: [
            // Main centered content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 300,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
                  // Remove or reduce SizedBox
                  // SizedBox(height: 20), // <-- Remove this line completely
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "C",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "IPHER",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "X",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bottom text section
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "By",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Open Source",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),SizedBox(width: 2,),
                      Text(
                        "Comunity",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Colors.orange.withOpacity(0.9),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
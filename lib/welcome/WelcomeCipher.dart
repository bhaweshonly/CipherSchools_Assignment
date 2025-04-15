import 'package:cipherschools_flutter_assignment/Homepage/homepage.dart';
import 'package:cipherschools_flutter_assignment/Signup _login page/Signup.dart';
import 'package:cipherschools_flutter_assignment/Signup _login page/loginpage.dart';
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
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(color: customPurple.shade300),
          // Logo in top-left corner
          Positioned(
            top: 20,
            left: 10,
            child: Image.asset(
              'assets/logo.png',
              height: 70,
              width: 90,
            ),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            right: 0,
            child: Container(
             /*width: MediaQuery.of(context).size.width*0.7*/
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  children: [  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    Text(
                      'CipherX.',
                      style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),],
                ),
                  Container(
                    margin: EdgeInsets.only(right: 40),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFFD1BEE9),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 28,
                      ),
                      onPressed: () {

                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Singup()));
                       },
                    ),
                  ),
                ],
              )
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
              SizedBox(
                child:   Text(
                  "The Best Way to  track your expenses",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
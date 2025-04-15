import 'package:cipherschools_flutter_assignment/Auth_services/Auth_service.dart';
import 'package:cipherschools_flutter_assignment/Homepage/homepage.dart';// update path accordingly
import 'package:cipherschools_flutter_assignment/Signup _login page/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
class Singup extends StatefulWidget {
  @override
  State<Singup> createState() => _SignupState();
}

class _SignupState extends State<Singup> {
  final Auth_services=Auth();
  final TextEditingController _Name=TextEditingController();
  final TextEditingController _Email=TextEditingController();
  final TextEditingController _Password=TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name
              TextField(
                controller: _Name,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF7F8F9),
                ),
              ),
              SizedBox(height: 16),

              // Email
              TextField(
                controller: _Email,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  labelText: "E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF7F8F9),
                ),
              ),
              SizedBox(height: 16),

              // Password
              TextField(
                controller: _Password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF7F8F9),
                ),
              ),
              SizedBox(height: 16),

              // Terms and Policy Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    activeColor: Colors.deepPurple,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'By signing up, you agree to the ',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                          TextSpan(
                            text: ' and ',
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Sign Up Button
              ElevatedButton(
                onPressed: _isChecked
                    ? () async {
                  String? errorms = await Auth().signup(
                    email: _Email.text.trim(),
                    password: _Password.text.trim(),
                    name: _Name.text.toString()
                  );
                  if (errorms == null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Loginpage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorms)),
                    );
                  }
                }
                    : null, // 🔒 Disabled if checkbox not checked
                style: ElevatedButton.styleFrom(
                  backgroundColor: customPurple.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 16),

              // OR Divider
              Row(
                children: <Widget>[
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Or"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: 16),

              // Google Sign Up Button
              OutlinedButton.icon(
                onPressed: () async {
                  UserCredential? userCredential = await Auth_services.loginWithGoogle(); // use the instance here
                  if (userCredential != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Google sign-in failed.")),
                    );
                  }
                },
                icon: Image.asset(
                  'assets/google1.png',
                  height: 20,
                ),
                label: Text(
                  "Sign Up with Google",
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(color: Colors.grey.shade300),
                  backgroundColor: Colors.white,
                ),
              ),

              SizedBox(height: 24),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Loginpage()));
                      // Navigate to login
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

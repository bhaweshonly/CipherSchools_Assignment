import 'package:cipherschools_flutter_assignment/Homepage/Income.dart';
import 'package:cipherschools_flutter_assignment/welcome/SplashScreen.dart';
import 'package:cipherschools_flutter_assignment/welcome/WelcomeCipher.dart';
import 'package:cipherschools_flutter_assignment/Homepage/expense.dart';
import 'package:cipherschools_flutter_assignment/Signup _login page/Signup.dart';
import 'package:cipherschools_flutter_assignment/Homepage/home_content1.dart';
import 'package:cipherschools_flutter_assignment/Homepage/homepage.dart';
import 'package:cipherschools_flutter_assignment/Signup _login page/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cipherschools_flutter_assignment/profile/profile.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Required before Firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Homepage(),
    );
  }
}
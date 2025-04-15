import 'package:cipherschools_flutter_assignment/Signup _login page/Signup.dart';
import 'package:cipherschools_flutter_assignment/Homepage/homepage.dart';
import 'package:flutter/material.dart';
import '../Auth_services/Auth_service.dart';
import '../welcome/SplashScreen.dart';
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
class Loginpage extends StatefulWidget{
  @override
  State<Loginpage> createState() => _LoginpageState();
}
class _LoginpageState extends State<Loginpage> {
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _Password = TextEditingController();
  final auth_services=Auth();
   // ✅ consistent naming
  bool _isLoading = false;

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Sign In",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
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
              TextField(
                controller: _Email,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  labelText: "E-mail",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Color(0xFFF7F8F9),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _Password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Color(0xFFF7F8F9),
                ),
              ),
              SizedBox(height: 16),

              // ✅ Login Button
              ElevatedButton(
                onPressed: ()async{
        String?error= await auth_services.Loginpage(
              email:_Email.text,
password:_Password.text
            );
        if(error==null){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Homepage()));
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
        }
        },
                style: ElevatedButton.styleFrom(
                  backgroundColor: customPurple.shade300,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                  "Login",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),

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

              OutlinedButton.icon(
                onPressed: () {}, // TODO: Add Google sign-in
                icon: Image.asset('assets/google1.png', height: 20),
                label: Text("Sign In with Google", style: TextStyle(color: Colors.black)),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  side: BorderSide(color: Colors.grey.shade300),
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Singup()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

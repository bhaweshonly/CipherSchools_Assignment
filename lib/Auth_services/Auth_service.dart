import 'dart:developer';
import 'package:cipherschools_flutter_assignment/Signup _login page/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Auth {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<UserCredential?> loginWithGoogle() async {
    try {
      // Step 1: Trigger Google Sign-In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Optional: Check if user cancelled
      if (googleUser == null) {
        log("⚠️ Google Sign-In cancelled by user.");
        return null;
      }

      // Step 2: Get auth details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Step 3: Create credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Step 4: Sign in and return UserCredential
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      return userCredential;

    } catch (e) {
      log("Exception during Google Sign-In: $e");
      return null;
    }
  }


  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Optional: You can also update the display name
      await userCredential.user?.updateDisplayName(name);

      return null; // Success
    } on FirebaseAuthException catch (e) {
      return 'Signup failed: ${e.message}';
    } catch (e) {
      return 'An unexpected error occurred: $e';
    }
  }


  Future<String?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If sign-in successful, return the user's UID
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided.';
      } else {
        return 'Login failed: ${e.message}';
      }
    } catch (e) {
      return 'An error occurred: $e';
    }
  }

  Future<String?>Loginpage({
    required String email,
    required String password
  }) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    }on FirebaseAuthException catch(e){
      String message="";
      if(e.code=='USer-not-found'){
        message="No user -found from this email";
      }
      else if(e.code=='wrong-password'){
        message="Wrong password please again";
      }
      else{
        message=e.message??"an error occured";
      }
      return message;
    }
    catch(e){
      return e.toString();
    }
  }

  Future<void> signOut()async{
    await _firebaseAuth.signOut();
  }
}

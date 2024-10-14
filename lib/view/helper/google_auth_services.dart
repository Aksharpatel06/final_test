import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthService{
  static GoogleAuthService googleAuthService = GoogleAuthService._();
  GoogleAuthService._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> createAccount(String email,String pwd)
  async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return 'SuccessFully Signup';
    }  catch (e) {
      print(e);
      return 'Please try again !';
    }
  }

  Future<String> loginAccount(String email,String pwd)
  async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pwd
      );
      return 'SuccessFully Login';
    }  catch (e) {
      print(e);
      return 'Please try again !';
    }
  }
}
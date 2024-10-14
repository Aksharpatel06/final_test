import 'dart:async';

import 'package:final_test/view/helper/google_auth_services.dart';
import 'package:final_test/view/screen/home/home_page.dart';
import 'package:final_test/view/screen/sign/signup_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) =>
        GoogleAuthService.googleAuthService.firebaseAuth.currentUser == null
            ? SignupPage()
            : HomePage(),));
    },);
    return Scaffold(
      body: Center(
        child: Image.asset(
          'asset/splash/Contacts_app_icon-removebg-preview.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

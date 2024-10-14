import 'package:final_test/utils/color.dart';
import 'package:final_test/view/controller/home_controller.dart';
import 'package:final_test/view/screen/sign/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/google_auth_services.dart';
import '../home/home_page.dart';
import 'componects/text_filed.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      backgroundColor: bgColor,
      body: Form(
        key: homeController.signInKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 28,
                color: secondaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Login to your account',
              style: TextStyle(
                fontSize: 16,
                color: primaryColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFiledInSign(
              textEditingController: homeController.txtEmail,
              hint: 'Enter Your Email',
            ),
            TextFiledInSign(
              textEditingController: homeController.txtPwd,
              hint: 'Enter Your Password',
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (homeController.signInKey.currentState!.validate()) {
                  String status = await GoogleAuthService.googleAuthService
                      .loginAccount(homeController.txtEmail.text,
                          homeController.txtPwd.text);

                  if (status == 'SuccessFully Login') {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  }

                  Get.snackbar('Signup', status);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ternaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Text(
                    'SignIn',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ? ',
                  style: TextStyle(
                    fontSize: 16,
                    color: secondaryColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignupPage(),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 200));
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w300,
                        decorationColor: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

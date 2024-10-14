import 'package:final_test/utils/color.dart';
import 'package:final_test/view/controller/home_controller.dart';
import 'package:final_test/view/helper/google_auth_services.dart';
import 'package:final_test/view/screen/home/home_page.dart';
import 'package:final_test/view/screen/sign/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'componects/text_filed.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      backgroundColor: bgColor,
      body: Form(
        key: homeController.signUpKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SignUp',
                style: TextStyle(
                  fontSize: 28,
                  color: secondaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Create a new account',
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
                textEditingController: homeController.txtComEmail,
                hint: 'Enter Your Email',
              ),
              TextFiledInSign(
                textEditingController: homeController.txtCreatePwd,
                hint: 'Enter Your Password',
              ),
              TextFiledInSign(
                textEditingController: homeController.txtComPwd,
                hint: 'Enter Compare Password',
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  if (homeController.signUpKey.currentState!.validate()) {
                    String status = await GoogleAuthService.googleAuthService
                        .createAccount(homeController.txtComEmail.text,
                            homeController.txtComPwd.text);

                    if (status == 'SuccessFully Signup') {
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
                      'SignUp',
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
                    'Create a new account ? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: secondaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SigninPage(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 200));
                    },
                    child: Text(
                      'SignIn',
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
      ),
    );
  }
}

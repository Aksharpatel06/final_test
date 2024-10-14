import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  TextEditingController txtComEmail = TextEditingController();
  TextEditingController txtComPwd = TextEditingController();
  TextEditingController txtCreatePwd = TextEditingController();
  TextEditingController txtPwd = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  var signUpKey = GlobalKey<FormState>();
  var signInKey = GlobalKey<FormState>();

}
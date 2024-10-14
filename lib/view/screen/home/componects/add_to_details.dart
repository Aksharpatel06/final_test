import 'package:final_test/view/screen/home/componects/text_field.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../controller/home_controller.dart';
import '../../../helper/db_services.dart';

void addToDetails(BuildContext context,HomeController homeController)
{
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: primaryColor,
      title: Text(
        'Add to details',
        style: TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        height: 200,
        child: Form(
          key: homeController.detailsKey,
          child: Column(
            children: [
              TextFiledDetails(
                  textEditingController: homeController.txtName,
                  hint: "Username"),
              TextFiledDetails(
                textEditingController: homeController.txtMobile,
                hint: "PhoneNumber",
                textInputType: TextInputType.phone,
              ),
              TextFiledDetails(
                  textEditingController: homeController.txtUserEmail,
                  hint: "Email"),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              if (homeController.detailsKey.currentState!.validate()) {
                Map data = {
                  'name': homeController.txtName.text,
                  'phoneNumber': homeController.txtMobile.text,
                  'email': homeController.txtUserEmail.text,
                };
                DbServices.dbServices.insertDatabase(data);
                homeController.contactDetailsShow();
                Navigator.pop(context);
              }
            },
            child: Text(
              'Save',
              style: TextStyle(color: bgColor),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: bgColor),
            )),
      ],
    ),
  );
}

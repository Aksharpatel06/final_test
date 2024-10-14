import 'package:final_test/utils/color.dart';
import 'package:final_test/view/controller/home_controller.dart';
import 'package:final_test/view/helper/db_services.dart';
import 'package:final_test/view/screen/home/componects/add_to_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'componects/text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: ternaryColor,
        title: Text(
          'Contact',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('You all data store to app store?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        homeController.allDataStoreToDataBase();
                        Navigator.pop(context);
                      },
                      child: Text('Yes'),
                    ),TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No'),
                    )
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.ac_unit,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchBar(
              onChanged: (value) {
                homeController.searchData(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => (homeController.contactList.isEmpty)
                  ? Center(
                      child: Text(
                        'Contact List Empty\'s',
                        style: TextStyle(color: secondaryColor, fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemCount: homeController.contactList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Text(
                                homeController.contactList[index].name,
                                style: TextStyle(
                                  color: secondaryColor,
                                ),
                              ),
                              subtitle: Text(
                                homeController.contactList[index].email,
                                style: TextStyle(
                                  color: secondaryColor,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        homeController.updateDetails(index);
                                        updateDetails(
                                            context, homeController, index);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: secondaryColor,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        homeController.deleteContact(index);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: secondaryColor,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ternaryColor,
        onPressed: () {
          addToDetails(context, homeController);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

void updateDetails(
    BuildContext context, HomeController homeController, int index) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: primaryColor,
      title: Text(
        'Update to details',
        style: TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        height: 200,
        child: Form(
          key: homeController.detailsUpdateKey,
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
              if (homeController.detailsUpdateKey.currentState!.validate()) {
                Map data = {
                  'name': homeController.txtName.text,
                  'phoneNumber': homeController.txtMobile.text,
                  'email': homeController.txtUserEmail.text,
                };
                DbServices.dbServices
                    .updateDatabase(data, homeController.contactList[index].id);
                homeController.contactDetailsShow();
                Navigator.pop(context);
              }
            },
            child: Text(
              'Update',
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

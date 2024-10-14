import 'package:final_test/view/helper/db_services.dart';
import 'package:final_test/view/helper/google_firestore_services.dart';
import 'package:final_test/view/modal/contact_modal.dart';
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
  var detailsKey = GlobalKey<FormState>();
  var detailsUpdateKey = GlobalKey<FormState>();

  TextEditingController txtName = TextEditingController();
  TextEditingController txtUserEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  RxList<ContactModal> contactList = <ContactModal>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    DbServices.dbServices.database;
    contactDetailsShow();
  }


  Future<void> contactDetailsShow()
  async {
    List dataList = await DbServices.dbServices.showDatabase();
    contactList.value = dataList.map((e) => ContactModal(e),).toList();
    update();
    contactList.refresh();
  }

  void deleteContact(int index)
  {
    DbServices.dbServices.deleteContact(contactList[index].id);
    contactList.removeAt(index);
    update();
    contactList.refresh();
  }


  void updateDetails(int index)
  {
    txtName = TextEditingController(text: contactList[index].name);
    txtUserEmail = TextEditingController(text: contactList[index].email);
    txtMobile = TextEditingController(text: contactList[index].phoneNumber);
    update();
  }

  void allDataStoreToDataBase()
  {
    for(ContactModal contactModal in contactList)
      {
        GoogleFirebaseServices.googleFirebaseServices.allDataStore(contactModal);
      }
  }

  void searchData(String value)
  {
    if(value.isNotEmpty || value!='')
    {
      contactList.value = contactList.where((contact) => contact.name.contains(value),).toList();
    } else{
      contactDetailsShow();
    }
    update();
    contactList.refresh();
  }

}
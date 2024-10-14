import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_test/view/modal/contact_modal.dart';

class GoogleFirebaseServices {
  static GoogleFirebaseServices googleFirebaseServices =
      GoogleFirebaseServices._();

  GoogleFirebaseServices._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void allDataStore(ContactModal contact) {
    try {
      CollectionReference users = firestore.collection('contact');
      users.doc(contact.id.toString()).set(contact.mapToModal(contact));
    } catch (e) {
      log(e.toString());
    }
  }

  Stream<QuerySnapshot<Object?>> getData() {
    Stream<QuerySnapshot> usersStream =
        firestore.collection('contact').snapshots();
    return usersStream;
  }
}

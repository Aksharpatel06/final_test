import 'package:final_test/view/helper/google_firestore_services.dart';
import 'package:final_test/view/modal/contact_modal.dart';
import 'package:flutter/material.dart';

import '../../../utils/color.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ternaryColor,
        leading: BackButton(
          color: primaryColor,
        ),
        title: Text('Details',style: TextStyle(color: Colors.white38),),
      ),
      body: StreamBuilder(
        stream: GoogleFirebaseServices.googleFirebaseServices.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          List<ContactModal> contactList = snapshot.data!.docs
              .map(
                (e) => ContactModal(e.data() as Map),
              )
              .toList();
          return ListView.builder(
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(
                      contactList[index].name,
                      style: TextStyle(
                        color: secondaryColor,
                      ),
                    ),
                    subtitle: Text(
                      contactList[index].email,
                      style: TextStyle(
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

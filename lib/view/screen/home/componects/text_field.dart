import 'package:flutter/material.dart';

import '../../../../utils/color.dart';

class TextFiledDetails extends StatelessWidget {
  const TextFiledDetails(
      {super.key,
        required this.textEditingController,
        required this.hint,
        this.textInputType});

  final TextEditingController textEditingController;
  final String hint;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty || value == '') {
            return 'Please enter details';
          }
        },
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white38),
          border:
          UnderlineInputBorder(borderSide: BorderSide(color: ternaryColor)),
        ),
      ),
    );
  }
}

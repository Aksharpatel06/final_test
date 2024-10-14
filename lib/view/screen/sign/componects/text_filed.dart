import 'package:flutter/material.dart';

import '../../../../utils/color.dart';

class TextFiledInSign extends StatelessWidget {
  const TextFiledInSign(
      {super.key, required this.textEditingController, required this.hint});

  final TextEditingController textEditingController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: TextFormField(
        validator: (value) {
          if(value!.isEmpty || value=='')
            {
              return 'Please enter details';
            }
        },
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: ternaryColor)
          ),
        ),
      ),
    );
  }
}

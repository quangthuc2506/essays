import 'package:flutter/material.dart';

Widget TextFormFieldInfor(
    {required IconData prefixIcon,
    IconData? suffixIcon,
    String? labelText,
    bool? readOnly,
    String? hintText,
    bool? observe = false,
    Function(String)? onChanged,
    TextEditingController? controller}) {
  readOnly ??= false;
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
    child: TextFormField(
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIcon,color: Colors.grey,),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: const TextStyle(color: Color(0xff44CECA)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff44CECA))),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Icon(
            prefixIcon,
            color: const Color(0xff44CECA),
          ),
        ),
        labelStyle: const TextStyle(color: Color(0xff44CECA)),
      ),
    ),
  );
}

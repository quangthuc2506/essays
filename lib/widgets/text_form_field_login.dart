import 'package:flutter/material.dart';

Widget textFormFieldLogin(
    {required IconData prefixIcon,
    required String labelText,
    IconData? suffixIcon,
    bool? readOnly,
    double? height,
    double? width,
    String? hintText,
    bool? observe = false,
    Function(String)? onChanged,
    TextEditingController? controller
    }) {
  height ??= 60;
  width ??= double.infinity;
  readOnly ??= false;
  return SizedBox(
    height: height,
    width: width,
    child: TextFormField(
      onChanged: onChanged,
      controller: controller,
      readOnly: readOnly,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.grey[300],
      obscureText: observe!,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
          label: Text(labelText),
          prefixIcon: Icon(
            prefixIcon,
            size: 20,
            color: Colors.grey,
          ),
          suffixIcon: Icon(
            suffixIcon,
            size: 25,
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
          labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(10))),
    ),
  );
}

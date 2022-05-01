import 'package:flutter/material.dart';

Widget myTextFormField(
    {required IconData prefixIcon,
    required String labelText,
    IconData? suffixIcon,
    bool? readOnly,
    double? height,
    TextEditingController? controller,
    double? width}) {
  height ??= 40;
  width ??= double.infinity;
  readOnly ??= false;
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    height: height,
    width: width,
    child: TextFormField(
      controller: controller,
      maxLines: null,
      readOnly: readOnly,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.grey[300],
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10,bottom: 10),
          label: Text(labelText),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            prefixIcon,
            size: 14,
            color: Colors.grey,
          ),
          suffixIcon: Icon(
            suffixIcon,
            size: 15,
            color: Colors.grey,
          ),
          labelStyle: TextStyle(color: Colors.grey[600], fontSize: 12),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(10))),
    ),
  );
}
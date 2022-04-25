import 'package:flutter/material.dart';

class ButtonWhiteBlack extends StatelessWidget {
  String text;
  double height = 44;
  double width = 234;
  ButtonWhiteBlack({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(234, 44),
          primary: Colors.white,
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(7))),
    );
  }
}

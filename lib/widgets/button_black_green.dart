import 'package:flutter/material.dart';

class ButtonBlackGreen extends StatelessWidget {
  String text;
  double height = 44;
  double width = 234;
  Function()? onPressed;
  ButtonBlackGreen({Key? key, required this.text, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(height: 1),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        primary: const Color(0xff0a0a0a),
        onPrimary: const Color(0xff95ae45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

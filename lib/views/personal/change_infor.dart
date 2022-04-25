import 'package:flutter/material.dart';

class ChangeInfor extends StatelessWidget {
  String title;
  ChangeInfor({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(title,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
      ),
    );
  }
}

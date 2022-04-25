import 'package:essays/values/app_assets.dart';
import 'package:essays/widgets/button_black_green.dart';
import 'package:essays/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class ScanToPay1 extends StatelessWidget {
  const ScanToPay1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          const Logo(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Scan To Pay",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: 221,
            height: 221,
            margin: const EdgeInsets.only(bottom: 45),
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppAssets.qrImage1))),
          ),
          ButtonBlackGreen(text: "SCAN NOW")
            ..width = 147
        ]),
      ),
    );
  }
}

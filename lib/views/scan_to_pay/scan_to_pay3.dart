import 'package:essays/values/app_assets.dart';
import 'package:essays/widgets/button_black_green.dart';
import 'package:essays/widgets/button_white_black.dart';
import 'package:flutter/material.dart';

class ScanToPay3 extends StatelessWidget {
  const ScanToPay3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image(image: AssetImage(AppAssets.reviewCompleted)),
                ),
                Text(
                  'Payment Completed!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff95ae45)),
                ),
                Text('Payment number: #9876543'),
              ],
            ),
            const Text(
              'Hope youe are happy with your purchase!\n Thank you for being a valued Thuc\'s customer!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                ButtonBlackGreen(text: 'Review Now'),
                const SizedBox(
                  height: 14,
                ),
                ButtonWhiteBlack(text: 'Go Home')
              ],
            )
          ],
        ),
      ),
    );
  }
}

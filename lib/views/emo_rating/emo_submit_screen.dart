import 'package:essays/values/app_assets.dart';
import 'package:flutter/material.dart';

class EmoSubmitScreen extends StatelessWidget {
  const EmoSubmitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: 121,
              height: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.reviewCompleted))),
            ),
            const Text(
              'Review Completed!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff95ae45)),
            ),
            const Text(
              'Hope you are happy with your purchase!\n Thank you for being a valued Thuc\'s customer!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Go Home'),
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black,
                  primary: Colors.white,
                  side: const BorderSide(width: 1),
                  fixedSize: const Size(193, 44)),
            )
          ],
        ),
      ),
    );
  }
}

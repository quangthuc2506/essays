import 'package:essays/values/app_assets.dart';
import 'package:essays/views/intro_login_signup_screen/login2.dart';
import 'package:essays/widgets/button_white_black.dart';
import 'package:flutter/material.dart';

class Login1Screen extends StatelessWidget {
  const Login1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 104,
              height: 127,
              child: Image(
                image: AssetImage(AppAssets.logo),
              ),
            ),
            const Text(
              "Thuc's",
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff95AE45)),
            ),
            const Text(
              "Restaurant",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff95AE45)),
            ),
            const SizedBox(
              height: 75,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login2Screen()));
              },
              child: const Text("Login Now"),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(234, 44),
                  primary: const Color(0xff0a0a0a),
                  onPrimary: const Color(0xff95ae45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7))),
            ),
            const SizedBox(
              height: 15,
            ),
            ButtonWhiteBlack(text: "Login Later")
          ],
        ),
      ),
    );
  }
}

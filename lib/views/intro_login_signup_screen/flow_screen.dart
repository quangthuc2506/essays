import 'package:essays/values/app_assets.dart';
import 'package:essays/views/intro_login_signup_screen/intro_screen.dart';
import 'package:flutter/material.dart';

class FlowScreen extends StatefulWidget {
  const FlowScreen({Key? key}) : super(key: key);
  @override
  State<FlowScreen> createState() => _FlowScreenState();
}

class _FlowScreenState extends State<FlowScreen> {
  @override
  void initState() {
    super.initState();
    toIntroScreen();
  }

  toIntroScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IntroScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.scale(
            scale: 0.33,
            child: Column(
              children: const [
                Image(
                  image: AssetImage(AppAssets.logo),
                ),
                Text(
                  "Thuc's",
                  style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff95AE45)),
                ),
                Text(
                  "Restaurant",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff95AE45)),
                )
              ],
            )),
      ),
    );
  }
}

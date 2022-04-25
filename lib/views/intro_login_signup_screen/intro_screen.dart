import 'package:essays/views/intro_login_signup_screen/app_banner_list_model.dart';
import 'package:essays/views/intro_login_signup_screen/login1.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 70, left: 40, right: 40),
            height: height * 0.65,
            width: width * 0.75,
            decoration: const BoxDecoration(),
            child: PageView.builder(
              controller: PageController(viewportFraction: 1),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              itemCount: appBannerList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: width * 0.75,
                      height: width * 0.75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(appBannerList[index].thumbnaiUrl!),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      appBannerList[index].title!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(appBannerList[index].content!)
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  appBannerList.length,
                  (index) => Indicator(
                      isActive: _selectedIndex == index ? true : false))
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Login1Screen())));
            },
            child: const Text("Getting Started"),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(176, 44),
                primary: const Color(0xff0a0a0a),
                onPrimary: const Color(0xff95ae45)),
          )
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 22 : 8,
      height: 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.grey,
          borderRadius: BorderRadius.circular(8)),
    );
  }
}

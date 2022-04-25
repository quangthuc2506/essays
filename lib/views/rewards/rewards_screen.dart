import 'package:essays/values/app_assets.dart';
import 'package:essays/views/rewards/rewards_redeem_screen.dart';
import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                RichText(
                  text: const TextSpan(
                      text: 'Thuc\'s ',
                      style: TextStyle(
                          color: Color(0xff95ae45),
                          fontSize: 36,
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: 'Rewards',
                            style: TextStyle(color: Colors.black))
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Text(
                            'Points last updated an 07/04/2022',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('0',
                              style: TextStyle(
                                  fontSize: 200,
                                  color: Colors.white,
                                  height: 1)),
                          Text('Points to Redeem',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RewardsRedeemScreen()));
                        },
                        child: const Text(
                          'Redeem my points',
                          style: TextStyle(color: Colors.black, height: 1),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            primary: const Color(0xff95ae45),
                            fixedSize: const Size(198, 34)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text('Earn 1000 more points to reach 1-star member'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                        width: 40,
                        height: 48,
                        child: Image(image: AssetImage(AppAssets.logo))),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 25,
                      width: 150,
                      child: const Text(
                        '1000',
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                        width: 40,
                        height: 48,
                        child: Image(image: AssetImage(AppAssets.logo)))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

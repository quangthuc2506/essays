import 'package:essays/values/app_assets.dart';
import 'package:essays/views/rewards/redeem_confirmation_screen.dart';
import 'package:flutter/material.dart';

class RewardsRedeemScreen extends StatelessWidget {
  const RewardsRedeemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: RichText(
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
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '100-300 points',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.8342),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RedeemConfirmation()));
                            },
                            child: Card(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  SizedBox(
                                    width: 84,
                                    height: 84,
                                    child: Image(
                                        image:
                                            AssetImage(AppAssets.cheeseBurger)),
                                  ),
                                  Text(
                                    'Cheese Burger',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '300 points',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

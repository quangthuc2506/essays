import 'package:essays/values/app_assets.dart';
import 'package:essays/views/main_page_screen.dart';
import 'package:flutter/material.dart';

class PersonalCouponTab extends StatelessWidget {
  const PersonalCouponTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Color(0xff44CECA),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width - 100,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 75,
                              height: 75,
                              child: const Image(
                                  image: AssetImage(AppAssets.giftIcon)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: const [
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        'Chào bạn mới | Tặng gói 125k',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                        maxLines: 2,
                                      ))
                                ]),
                                Row(
                                  children: const [
                                    Text(
                                      'HSD: 27.05.2022',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainPageScreen(currentIndex: 1,)));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      margin:
                          const EdgeInsets.only(top: 15, right: 15, left: 1),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: const Text(
                        'Chọn',
                        style: TextStyle(color: Color(0xff44CECA)),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}

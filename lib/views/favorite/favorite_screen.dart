import 'package:essays/values/app_assets.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text(
          'Yêu thích',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const Divider(
              height: 20,
              thickness: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin:
                        const EdgeInsets.only(top: 15, bottom: 15, right: 15),
                    child:
                        const Image(image: AssetImage(AppAssets.salmonSalad)),
                  ),
                  SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ice Cream',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        const Text(
                          'Đã mua: 100',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Transform.translate(
                          offset: const Offset(-15, 0),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.remove,
                                  color: Color(0xff44CECA),
                                ),
                                style: TextButton.styleFrom(
                                  minimumSize: const Size(30, 30),
                                  padding: EdgeInsets.zero,
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.grey[300],
                                ),
                              ),
                              const Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.add,
                                  color: Color(0xff44CECA),
                                  size: 20,
                                ),
                                style: TextButton.styleFrom(
                                  minimumSize: const Size(30, 30),
                                  padding: EdgeInsets.zero,
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Thêm vào giỏ',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              backgroundColor: const Color(0xff3AC5C8)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

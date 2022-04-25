import 'package:essays/values/app_assets.dart';
import 'package:essays/widgets/button_black_green.dart';
import 'package:flutter/material.dart';

class HotDealScreen extends StatelessWidget {
  const HotDealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(" Lastest deals on your hand!",style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
              ),
              SizedBox(
                width: width,
                height: width * 0.4012,
                child: Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(AppAssets.bannerReward),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 118,
                          height: 114,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xfff0ece6),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2,color: Colors.grey.shade300)
                          ),
                          child: const Image(image: AssetImage(AppAssets.hotDeal1)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('CUSTOMER BENEFITS',style: TextStyle(fontSize: 10,color: Colors.grey,fontWeight: FontWeight.w500),textAlign: TextAlign.end,),
                              const Text('Thuc\'s\nGreatest Deal',style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                              ButtonBlackGreen(text: 'Learn more')..width = 105..height=19
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

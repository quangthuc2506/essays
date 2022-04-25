import 'package:essays/views/coupon/personal_coupon_tab.dart';
import 'package:flutter/material.dart';

class CouponScreen extends StatelessWidget {
   const CouponScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
          title: const Text(
            'Ưu đãi',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Color(0xff44CECA),
            tabs: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Mã cá nhân',
                  style: TextStyle(color: Color(0xff44CECA), fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Deal hot khuyến mãi',
                  style: TextStyle(color: Color(0xff44CECA), fontSize: 16),
                ),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [PersonalCouponTab(), Icon(Icons.reddit)],
        ),
      ),
    );
  }
}

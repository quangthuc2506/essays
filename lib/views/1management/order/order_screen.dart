import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/order/order_waiting.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const Image(
            image: AssetImage(AppAssets.backgroundAppbar),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
          title: const Text("Danh sách đơn hàng"),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                icon: Text(
                  'Chờ xác nhận',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                icon: Text(
                  'Chờ lấy hàng',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                icon: Text(
                  'Đang giao',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                icon: Text(
                  'Đã giao',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                icon: Text(
                  'Đã huỷ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            OrrderWaiting(),
            const Center(
              child: Text("It's rainy here"),
            ),
            const Center(
              child: Text("It's sunny here"),
            ),
            const Center(
              child: Text("It's sunny here"),
            ),
            const Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/view/order/order_cancel_tab.dart';
import 'package:essays/views/1management/view/order/order_confirmded_tab.dart';
import 'package:essays/views/1management/view/order/order_delivered_tab.dart';
import 'package:essays/views/1management/view/order/order_delivery_tab.dart';
import 'package:essays/views/1management/view/order/order_waiting_tab.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  int? initial;

  OrderScreen({Key? key, this.initial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initial ??= 0;
    return DefaultTabController(
      initialIndex: initial!,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const Image(
            image: AssetImage(AppAssets.backgroundAppbar),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text("Danh sách đơn hàng"),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
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
        body:  const TabBarView(
          children: [
            OrderWaitingTab(),
            OrderConfirmedTab(),
            OrderDeliveryTab(),
            OrderDeliveredTab(),
            OrderCancelTab(),
          ],
        ),
      ),
    );
  }
}

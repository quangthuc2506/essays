import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/view/overview/accountInfor_admin.dart';
import 'package:essays/views/1management/view/overview/statistic_tab.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const Image(
            image: AssetImage(AppAssets.backgroundAppbar),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
          title: const Text("Hoạt động"),
          leading: const Icon(
            Icons.poll_sharp,
            color: Colors.white,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountInforAdmin()));
                },
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            )
          ],
          centerTitle: true,
          elevation: 0,
          // bottom: const TabBar(
          //   tabs: [
          //     Tab(
          //       icon: Text(
          //         'Thống kê',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(color: Colors.black),
          //       ),
          //     ),
          //     Tab(
          //       icon: Text(
          //         'Nhật ký',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(color: Colors.black),
          //       ),
          //     ),
          //   ],
          // ),
        ),
        // body: const TabBarView(
        //   children: [
        //     StatisticScreen(),
        //     Center(
        //       child: Text("It's sunny here"),
        //     ),
        //   ],
        // ),

        body: const StatisticScreen(),
      ),
    );
  }
}

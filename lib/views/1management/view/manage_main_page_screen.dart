import 'package:essays/views/1management/view/manage_home_page_screen.dart';
import 'package:essays/views/1management/view/overview/overview_Screen.dart';
import 'package:essays/views/1management/view/product/management_product_screen.dart';
import 'package:essays/views/1management/view/reserve/table_screen.dart';
import 'package:flutter/material.dart';

class ManageMainPageScreen extends StatefulWidget {
  ManageMainPageScreen({Key? key, required this.currentIndex});
  int currentIndex = 1;
  @override
  State<ManageMainPageScreen> createState() => _ManageMainPageScreenState();
}

class _ManageMainPageScreenState extends State<ManageMainPageScreen> {
  final screens = [
    const ManageHomeScreen(),
    const TableScreen(),
    const ProductsManagementScreen(),
    const OverviewScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[widget.currentIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400, spreadRadius: 0, blurRadius: 10)
            ]),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Trang chủ'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Bàn'),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_bar), label: 'Kho/sản phẩm'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Tài khoản'),
          ],
          currentIndex: widget.currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xffB3282D),
          iconSize: 25,
          onTap: (index) {
            setState(() {
              widget.currentIndex = index;
            });
          },
          unselectedItemColor: const Color(0xff6F645D),
          unselectedLabelStyle: const TextStyle(color: Color(0xff6F645D)),
        ),
      ),
    );
  }
}

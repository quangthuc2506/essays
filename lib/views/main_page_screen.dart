import 'package:essays/views/home_screen/home_screen.dart';
import 'package:essays/views/menu_screen/menu_screen.dart';
import 'package:essays/views/personal/personal_screen.dart';
import 'package:essays/views/reserve/reserve_screen.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatefulWidget {
  MainPageScreen({Key? key, required this.currentIndex});
  int currentIndex = 0;
  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  final screens = [
    HomeScreen(),
    MenuScreen(),
    const ReserveScreen(),
    const PersonalScreen()
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
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menu'),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_bar), label: 'Đặt bàn'),
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

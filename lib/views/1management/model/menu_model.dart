import 'package:flutter/Material.dart';

class MenuModel {
  IconData icon;
  String content;
  Color? color;
  MenuModel({required this.icon, required this.content, this.color});
}

List<MenuModel> menuList = [
  MenuModel(
      icon: Icons.abc,
      content: 'Tạo đơn và giao hàng',
      color: const Color(0xff299BFE)),
  MenuModel(
      icon: Icons.abc,
      content: 'Tạo đơn tại quầy',
      color: const Color(0xff299BFE)),
  MenuModel(
      icon: Icons.abc,
      content: 'Thanh toán tại quầy',
      color: const Color(0xff299BFE)),
  MenuModel(
      icon: Icons.abc,
      content: 'Thêm sản phẩm',
      color: const Color(0xff13D187)),
  MenuModel(
      icon: Icons.abc,
      content: 'Quản lý nhân viên',
      color: const Color(0xff13D187)),
  MenuModel(
      icon: Icons.abc, content: 'Quản lý kho', color: const Color(0xff299BFE)),
  MenuModel(
      icon: Icons.abc,
      content: 'Quản lý giao hàng',
      color: const Color(0xff13D187)),
  MenuModel(
      icon: Icons.abc,
      content: 'Quản doanh thu',
      color: const Color(0xff13D187))
];
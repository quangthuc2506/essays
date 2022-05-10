import 'package:essays/values/app_assets.dart';
import 'package:flutter/Material.dart';

class MenuModel {
  Widget icon;
  String content;
  Color? color;
  MenuModel({required this.icon, required this.content, this.color});
}

List<MenuModel> menuList = [
  MenuModel(
      icon: Image.asset(AppAssets.taoDonVaGiaoHangIcon),
      content: 'Quản lý đơn hàng',
      color: const Color(0xff299BFE)),
  MenuModel(
      icon: Image.asset(AppAssets.tableIcon),
      content: 'Quản lý bàn ăn',
      color: const Color(0xff299BFE)),
  MenuModel(
      icon: Image.asset(AppAssets.khoIcon),
      content: 'Quản lý kho',
      color: const Color(0xff299BFE)),
  MenuModel(
      icon: Image.asset(AppAssets.themSanPham),
      content: 'Thêm sản phẩm',
      color: const Color(0xff13D187)),
  MenuModel(
      icon: Image.asset(AppAssets.nhanvienIcon),
      content: 'Quản lý nhân viên',
      color: const Color(0xff13D187)),
  MenuModel(
      icon: Image.asset(AppAssets.khoIcon),
      content: 'Quản lý kho',
      color: const Color(0xff299BFE)),
  MenuModel(
      icon: Image.asset(AppAssets.doanhThuIcon),
      content: 'Quản lý doanh thu',
      color: const Color(0xff13D187)),
  MenuModel(
      icon: Image.asset(AppAssets.nhatKyIcon),
      content: 'Nhật ký',
      color: const Color(0xff13D187))
];

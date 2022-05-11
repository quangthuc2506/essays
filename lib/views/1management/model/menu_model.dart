import 'package:essays/values/app_assets.dart';
import 'package:flutter/Material.dart';

class MenuModel {
  Widget icon;
  String content;
  Color? color;
  int? id;
  MenuModel({required this.icon, required this.content, this.color, this.id});
}

List<MenuModel> menuList = [
  MenuModel(
    id: 1,
    icon: Image.asset(AppAssets.taoDonVaGiaoHangIcon),
    content: 'Quản lý đơn hàng',
    color: const Color(0xff299BFE),
  ),
  MenuModel(
      id: 2,
      icon: Image.asset(AppAssets.tableIcon),
      content: 'Quản lý bàn ăn',
      color: const Color(0xff299BFE)),
  MenuModel(
      id: 3,
      icon: Image.asset(AppAssets.khoIcon),
      content: 'Quản lý kho',
      color: const Color(0xff299BFE)),
  MenuModel(
      id: 4,
      icon: Image.asset(AppAssets.themSanPham),
      content: 'Thêm sản phẩm',
      color: const Color(0xff13D187)),
  MenuModel(
      id: 5,
      icon: Image.asset(AppAssets.nhanvienIcon),
      content: 'Quản lý nhân viên',
      color: const Color(0xff13D187)),
  MenuModel(
      id: 6,
      icon: Image.asset(AppAssets.reservedIcon),
      content: 'Quản lý đơn đặt bàn',
      color: const Color(0xff299BFE)),
  MenuModel(
      id: 7,
      icon: Image.asset(AppAssets.doanhThuIcon),
      content: 'Quản lý doanh thu',
      color: const Color(0xff13D187)),
  MenuModel(
      id: 8,
      icon: Image.asset(AppAssets.nhatKyIcon),
      content: 'Nhật ký',
      color: const Color(0xff13D187))
];

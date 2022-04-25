import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String categoryId;
  String categoryName;
  String icon;
  Category(
      {required this.categoryId,
      required this.categoryName,
      required this.icon});
  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
        categoryId: snap['categoryId'],
        categoryName: snap['categoryName'],
        icon: snap['icon']);
    return category;
  }
}

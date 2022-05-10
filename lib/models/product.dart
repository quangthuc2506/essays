import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String categoryId;
  String productId;
  String productName;
  String details;
  int price;
  String image;
  String review;
  int? amount;
  String? categoryname;
  String? sale;
  int? cost;
  Product(
      {required this.categoryId,
      required this.productId,
      required this.productName,
      required this.details,
      required this.image,
      required this.price,
      required this.review,
      this.amount,
      this.cost,
      this.sale,
      this.categoryname});
  static Product fromSnapshot(DocumentSnapshot snap) {
     final dynamic data = snap.data();
    Product product = Product(
        categoryId: data['categoryId'],
        productId: data['productId'],
        productName: data['productName'],
        details: data['details'],
        image: data['image'],
        price: data['price'],
        review: data['review'],
        amount: data['amount'],
        cost: data['cost'],
        sale: data['sale']);
    return product;
  }

  Map<String, dynamic> toJson() => {
        'categoryId': categoryId,
        'productId': productId,
        'productName': productName,
        'details': details,
        'image': image,
        'price': price,
        'review': review,
        'amount': amount,
        'cost':cost
      };
}

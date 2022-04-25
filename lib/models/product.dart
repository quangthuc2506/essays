import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String categoryId;
  String productId;
  String productName;
  String details;
  String price;
  String image;
  String review;
  String? amount;
  String? categoryname;
  Product(
      {required this.categoryId,
      required this.productId,
      required this.productName,
      required this.details,
      required this.image,
      required this.price,
      required this.review,
      this.amount,
      this.categoryname
      });
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        categoryId: snap['categoryId'],
        productId: snap['productId'],
        productName: snap['productName'],
        details: snap['details'],
        image: snap['image'],
        price: snap['price'],
        review: snap['review'],
        amount: snap['amount']);
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
        'amount': amount
      };
}

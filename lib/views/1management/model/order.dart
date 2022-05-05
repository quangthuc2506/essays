import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  int? amount;
  String? orderId;
  int? price;
  String? productId;
  String? status;
  Order({this.amount, this.orderId, this.price, this.productId, this.status});
  static Order fromSnapshot(DocumentSnapshot snap) {
    final dynamic data = snap.data();
    return Order(
        amount: data['amount'],
        orderId: data['orderId'],
        price: data['price'],
        productId: data['productId'],
        status: data['status']);
  }
}

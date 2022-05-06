import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDetails {
  int? amount;
  String? orderId;
  int? price;
  String? productId;
  String? status;
  OrderDetails({this.amount, this.orderId, this.price, this.productId, this.status});
  static OrderDetails fromSnapshot(DocumentSnapshot snap) {
    final dynamic data = snap.data();
    return OrderDetails(
        amount: data['amount'],
        orderId: data['orderId'],
        price: data['price'],
        productId: data['productId'],
        status: data['status']);
  }
}
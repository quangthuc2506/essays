import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  String? email;
  String? productId;
  String? amount;
  String? price;
  String? image;
  String? productName;
  String? note;
  Cart({this.email, this.productId, this.amount, this.image,this.note,this.price,this.productName});
  static Cart fromSnapshot(DocumentSnapshot snap) {
    Cart cart = Cart(
      email: snap['email'],
      productId: snap['productId'],
      amount: snap['amount'],
      image: snap['image'],
      productName: snap['productName'],
      note: snap['note'],
      price: snap['price']
    );
    return cart;
  }
}

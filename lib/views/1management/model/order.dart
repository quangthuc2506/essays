import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String? address;
  String? customerId;
  DateTime? date;
  String? orderId;
  String? status;
  String? note;
  Order({this.address, this.customerId, this.date, this.orderId, this.status, this.note});
  static Order fromSnapshot(DocumentSnapshot snap) {
    final dynamic data = snap.data();
    Timestamp now = data['date'];
    DateTime getDate = now.toDate();
    // var d24 = DateFormat('dd/MM/yyyy, HH:mm').format(mls);// 31/12/2000, 22:00
    return Order(
        address: data['address'],
        customerId: data['customerId'],
        date: getDate,
        orderId: data['orderId'],
        note: data['note'],
        status: data['status']);
  }
}

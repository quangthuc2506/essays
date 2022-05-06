import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/views/1management/model/order_details.dart';
import 'package:essays/views/1management/model/order.dart';

class OrderRepository {
  Stream<List<OrderDetails>> getAllOrdersDetails() async* {
    yield* FirebaseFirestore.instance
        .collection('orderDetails')
        .where('status', isEqualTo: 'Chờ xác nhận')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => OrderDetails.fromSnapshot(doc)).toList();
    });
  }
  Stream<List<Order>> getAllOrder() async*{
    yield* FirebaseFirestore.instance
        .collection('order')
        .where('status', isEqualTo: 'Chờ xác nhận')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }
  
}

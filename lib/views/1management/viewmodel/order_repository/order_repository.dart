import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/views/1management/model/order_details.dart';
import 'package:essays/views/1management/model/order.dart';

class OrderRepository {
  final _fireStore = FirebaseFirestore.instance;
  Stream<List<OrderDetails>> getAllOrdersDetails() async* {
    yield* _fireStore
        .collection('orderDetails')
        .where('status', isEqualTo: 'Chờ xác nhận')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => OrderDetails.fromSnapshot(doc))
          .toList();
    });
  }

  Stream<List<Order>> getAllOrder() async* {
    yield* _fireStore
        .collection('order')
        .where('status', isEqualTo: 'Chờ xác nhận')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
    // }
    // Stream<List<Order>> getAllOrder2() async*{
    //   yield* FirebaseFirestore.instance
    //       .collection('order')
    //       .snapshots()
    //       .map((snapshot) {
    //     return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    //   });
  }

  Future<List<Order>> getOrders2() async {
    List<Order> list =
        await _fireStore.collection('order').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Order.fromSnapshot(doc);
      }).toList();
    }).first;
    List<Order> filteredList = [];
    for (Order item in list) {
      filteredList.add(item);
    }
    return filteredList;
  }
}

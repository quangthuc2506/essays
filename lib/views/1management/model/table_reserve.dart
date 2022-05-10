import 'package:cloud_firestore/cloud_firestore.dart';

class DinnerTable {
  String? tableId;
  String? productId;
  int? amount;
  DinnerTable({this.tableId, this.productId, this.amount});
  static DinnerTable fromSnapshot(DocumentSnapshot snap) {
    DinnerTable table = DinnerTable(
      tableId: snap['tableId'],
      productId: snap['productId'],
      amount: snap['amount'],
    );
    return table;
  }
}

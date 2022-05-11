import 'package:cloud_firestore/cloud_firestore.dart';

class TableStatus {
  int? tableId;
  String? status;
  TableStatus({this.tableId, this.status});
  static TableStatus fromSnapshot(DocumentSnapshot snap) {
    TableStatus table = TableStatus(
      tableId: snap['tableId'],
      status: snap['status'],
    );
    return table;
  }
}

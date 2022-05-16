import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? email;
  String? phoneNumber;

  User({this.email, this.phoneNumber});
  static User fromSnapshot(DocumentSnapshot snap) {
    final dynamic data = snap.data();
    return User(email: data['email'], phoneNumber: data['phoneNumber']);
  }
}

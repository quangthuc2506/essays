import 'package:cloud_firestore/cloud_firestore.dart';

class BaseUser {
  String? name;
  String? email;
  String? phoneNumber;
  String? position;
  String? image;
  BaseUser({this.name, this.email, this.phoneNumber, this.position,this.image});
  static BaseUser fromSnapshot(DocumentSnapshot snap) {
    BaseUser user = BaseUser(
        email: snap['email'],
        name: snap['name'],
        phoneNumber: snap['phoneNumber'],
        image: snap['avatar'],
        position: snap['position']);
    return user;
  }
}

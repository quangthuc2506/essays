import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? name;
  String? email;
  String? phoneNumber;
  String? position;
  String? image;
  User({this.name, this.email, this.phoneNumber, this.position,this.image});
  static User fromSnapshot(DocumentSnapshot snap) {
    User user = User(
        email: snap['email'],
        name: snap['name'],
        phoneNumber: snap['phoneNumber'],
        image: snap['avatar'],
        position: snap['position']);
    return user;
  }
}

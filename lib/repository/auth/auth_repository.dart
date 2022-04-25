import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/repository/auth/base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends BaseAuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _googleSignIn = GoogleSignIn(scopes: ['email']);
  GoogleSignInAccount? currentUser;

  @override
  Future<void> signUp(
      {required String email,
      required String password,
      required String fullName,
      required String phoneNumber}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final _user = FirebaseAuth.instance.currentUser;
      await _firestore.collection('user').doc(_user!.uid).set({
        'name': fullName,
        'email': _user.email,
        'avatar': '',
        'phoneNumber': phoneNumber,
        'password': password,
        'point': '0'
      });
    } on PlatformException {}
  }

  @override
  Future<void> singIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on PlatformException {}
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      final _user = FirebaseAuth.instance.currentUser;
      await _firestore.collection('user').doc(_user!.uid).set({
        'name': _user.displayName,
        'email': _user.email,
        'avatar': _user.photoURL,
        'phoneNumber': '',
        'password': '',
        'point': '0'
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getUser(String email) async {
    Map<String, dynamic> userMap = await _firestore
        .collection('user')
        .where('email', isEqualTo: email)
        .get()
        .then((value) {
      return value.docs[0].data();
    });
    // print('thuc: $userMap');
    // print(
    //     'test: ${_firestore.collection('user').where('email', isEqualTo: email).snapshots().forEach((element) {
    //   print(element.docs[0]);
    // })}');
    return userMap;
  }

  @override
  Future<void> updateInfor({String? name, String? phoneNumber}) async {
    final _user = FirebaseAuth.instance.currentUser;
    await _firestore
        .collection('user')
        .doc(_user!.uid)
        .update({'name': name, 'phoneNumber': phoneNumber});
  }
  // @override
  // Future<Map<String, dynamic>> getUser(String email) async {
  //   Map<String, dynamic> userMap = {};
  //   _firestore
  //       .collection('user')
  //       .where('email', isEqualTo: email)
  //       .snapshots()
  //       .map((event) {
  //     userMap['name'] = event.docs[0]['name'];
  //     userMap['email'] = event.docs[0]['email'];
  //     userMap['point'] = event.docs[0]['point'];
  //     userMap['avatar'] = event.docs[0]['avatar'];
  //   });
  //   return userMap;
  // }
}

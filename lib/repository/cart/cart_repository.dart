import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/models/cart.dart';
import 'package:essays/repository/cart/base_cart_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartRepository extends BaseCartRepository {
  @override
  Stream<List<Cart>> getAllCarts() async* {
    final _user = FirebaseAuth.instance.currentUser;
    print('user: ${_user!.email}');
    yield* FirebaseFirestore.instance
        .collection('cart')
        .where('email', isEqualTo: _user.email)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Cart.fromSnapshot(doc);
      }).toList();
    });
  }
}

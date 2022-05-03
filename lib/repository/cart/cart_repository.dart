import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/models/cart.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/cart/base_cart_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartRepository extends BaseCartRepository {
  @override
  Stream<List<Cart>> getAllCarts() async* {
    final _user = FirebaseAuth.instance.currentUser;

    yield* FirebaseFirestore.instance
        .collection('cart')
        .where('email', isEqualTo: _user!.email)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Cart.fromSnapshot(doc);
      }).toList();
    });
  }

  Future<List<Product>> getAllProduct() async {
    List<Product> list = await FirebaseFirestore.instance
        .collection('product')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    }).first;
    return list;
  }

  Future<void> addToCart({ required Product product, int? amount}) async {
    amount ??= 1;
    String email = FirebaseAuth.instance.currentUser!.email!;
    Map<String, dynamic> productMap = {
      'amount': amount,
      'note': '',
      'email': FirebaseAuth.instance.currentUser!.email,
      'productName': product.productName,
      'productId': product.productId,
      'price': product.price,
      'image': product.image
    };
    await FirebaseFirestore.instance
        .collection('cart')
        .doc(email + product.productId)
        .set(productMap);
  }

  Future<void> deleteFromTheCart(Cart cart) async {
    String email = FirebaseAuth.instance.currentUser!.email!;
    print('delete: ${email + cart.productId!}');
    await FirebaseFirestore.instance
        .collection('cart')
        .doc(email + cart.productId!)
        .delete();
  }

  Future<void> deleteAllFromTheCart() async {
    var _fireStore = FirebaseFirestore.instance;
    String email = FirebaseAuth.instance.currentUser!.email!;
    var emptyCarts = FirebaseFirestore.instance
        .collection('cart')
        .where('email', isEqualTo: email)
        .get()
        .then((querySnapshot) {
      var batch = _fireStore.batch();
      for (var element in querySnapshot.docs) {
        batch.delete(element.reference);
      }
      return batch.commit();
    }).then((value) => null);
  }
}

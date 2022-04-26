import 'package:essays/models/cart.dart';

abstract class BaseCartRepository {
  Stream<List<Cart>> getAllCarts();
}
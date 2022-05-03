part of 'cart_bloc.dart';

abstract class CartEvent {}

class LoadCartsEvent extends CartEvent {}

class UpdatedCartsEvent extends CartEvent {
  final List<Cart> carts;
  UpdatedCartsEvent(this.carts);
}

class AddToCartEvent extends CartEvent {
  final Product product;
  final int? amount;
  AddToCartEvent({required this.product, this.amount});
}

class DeleteFromTheCartEvent extends CartEvent {
  final Cart cart;
  DeleteFromTheCartEvent({required this.cart});
}

class DeleteAllFromTheCartEvent extends CartEvent {}

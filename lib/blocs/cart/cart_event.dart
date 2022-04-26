part of 'cart_bloc.dart';

abstract class CartEvent {}

class LoadCartsEvent extends CartEvent {}

class UpdatedCartsEvent extends CartEvent {
  final List<Cart> carts;
  UpdatedCartsEvent(this.carts);
}

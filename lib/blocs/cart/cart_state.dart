part of 'cart_bloc.dart';

abstract class CartState {}

class LoadingCartState extends CartState {}

class LoadedCartState extends CartState {
  final List<Cart> carts;
  LoadedCartState({this.carts = const <Cart>[]});
}

class CartErrorState extends CartState {
  final String message;
  CartErrorState(this.message);
}

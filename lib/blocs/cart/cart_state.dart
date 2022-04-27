part of 'cart_bloc.dart';

abstract class CartState {}

class LoadingCartState extends CartState {}

class LoadedCartState extends CartState {
  final List<Cart> carts;
  LoadedCartState({this.carts = const <Cart>[]});
  getAmountTotal() {
    int amountTotal = 0;
    for (Cart cart in carts) {
      amountTotal += int.parse(cart.amount!);
    }
    return amountTotal;
  }

  int getPriceTotal() {
    int priceTotal = 0;
    for (Cart cart in carts) {
      priceTotal += int.parse(cart.amount!) * int.parse(cart.price!);
    }

    return priceTotal;
  }

  String? moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value;
    }
    return null;
  }
}

class CartErrorState extends CartState {
  final String message;
  CartErrorState(this.message);
}

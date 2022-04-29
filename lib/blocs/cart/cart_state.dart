part of 'cart_bloc.dart';

abstract class CartState {}

class LoadingCartState extends CartState {}

class LoadedCartState extends CartState {
  final List<Cart> carts;
  LoadedCartState({this.carts = const <Cart>[]});
  getAmountTotal() {
    int amountTotal = 0;
    for (Cart cart in carts) {
      amountTotal += cart.amount!;
    }
    return amountTotal;
  }

  int getPriceTotal() {
    int priceTotal = 0;
    for (Cart cart in carts) {
      priceTotal += cart.amount! * cart.price!;
    }

    return priceTotal;
  }

  String? moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value;
    } else {
      return '0';
    }
    return null;
  }
}

class CartErrorState extends CartState {
  final String message;
  CartErrorState(this.message);
}

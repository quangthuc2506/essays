part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class LoadingProductSate extends ProductState {}
class LoadedProductState extends ProductState{
   final List<Product> products;
  LoadedProductState({this.products = const <Product>[]});
  
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


class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState(this.message);
}
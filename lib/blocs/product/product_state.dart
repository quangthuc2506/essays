part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class LoadingProductSate extends ProductState {}
class LoadedProductState extends ProductState{
   final List<Product> products;
  LoadedProductState({this.products = const <Product>[]});
}


class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState(this.message);
}
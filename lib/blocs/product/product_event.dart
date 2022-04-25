part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class LoadHotProductEvent extends ProductEvent {}

class UpdatedProductEvent extends ProductEvent {
  final List<Product> products;
  UpdatedProductEvent(this.products);
}

class LoadProductEvent extends ProductEvent {}

class SearchProductByNameEvent extends ProductEvent {
  final String productName;
  SearchProductByNameEvent({required this.productName});
}

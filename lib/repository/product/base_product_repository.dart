import 'package:essays/models/product.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProduct();
  Stream<List<Product>> getHotProduct();
  Future<List<Product>> searchProduct({required String productName});
  Stream<List<Product>> searchProductsByCategoryname(
      {required String categoryName});
  Future<List<Product>> getAllProduct2({String? value});
}

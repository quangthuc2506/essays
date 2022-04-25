import 'package:essays/models/product.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProduct();
  Stream<List<Product>> getHotProduct();
  Future<List<Product>> searchProduct({required String productName});
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/models/category.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProduct() async* {
    await getCategoriesList();
    yield* _firebaseFirestore.collection('product').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        String id = Product.fromSnapshot(doc).categoryId;
        String name = getCategoryName(id);
        return Product.fromSnapshot(doc)..categoryname = name;
      }).toList();
    });
  }

  List<Category>? categoriesList;
  Future<List<Category>> getCategoriesList() async {
    List<Category> categoriesList1 = await _firebaseFirestore
        .collection('category')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    }).first;
    categoriesList = categoriesList1;
    return categoriesList1;
  }

  String getCategoryName(String categoryId) {
    for (Category ct in categoriesList!) {
      if (ct.categoryId == categoryId) {
        return ct.categoryName;
      }
    }
    return 'Food';
  }

  String getCategoryId(String categoryName) {
    for (Category ct in categoriesList!) {
      if (ct.categoryName == categoryName) {
        return ct.categoryId;
      }
    }
    return '001';
  }

  @override
  Stream<List<Product>> getHotProduct() async* {
    await getCategoriesList();
    yield* _firebaseFirestore
        .collection('product')
        .where('categoryId', whereIn: ['001', '002'])
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            String id = Product.fromSnapshot(doc).categoryId;
            String name = getCategoryName(id);
            return Product.fromSnapshot(doc)..categoryname = name;
          }).toList();
        });
  }

  @override
  Future<List<Product>> searchProduct({required String productName}) async {
    await getCategoriesList();
    List<Product> list = await _firebaseFirestore
        .collection('product')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        String id = Product.fromSnapshot(doc).categoryId;
        String name = getCategoryName(id);
        return Product.fromSnapshot(doc)..categoryname = name;
      }).toList();
    }).first;
    List<Product> filteredList = [];
    for (Product item in list) {
      String id = getCategoryId(productName);
      if (item.categoryId == id) {
        filteredList.add(item);
      }
    }
    return filteredList;
  }

  
}

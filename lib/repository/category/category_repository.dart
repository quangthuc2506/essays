import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/models/category.dart';
import 'package:essays/repository/category/base_category_reprository.dart';
import 'package:essays/values/app_assets.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;
  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection('category')
        .snapshots()
        .map((snapshot) {
      print("snapshot category: ${snapshot.docs.length}");
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<List<Category>> getAllCategories2({String? value}) async {
    List<Category> list = await _firebaseFirestore
        .collection('category')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Category.fromSnapshot(doc);
      }).toList();
    }).first;
    List<Category> filteredList = [];
    if (value != null) {
      filteredList.insert(
          0,
          Category(
              icon: AppAssets.dessertIcon,
              categoryId: "000",
              categoryName: "All"));
      for (Category item in list) {
        if (item.categoryName.toLowerCase().contains(value.toLowerCase())) {
          filteredList.add(item);
        }
      }
    } else {
      filteredList.insert(
          0,
          Category(
              icon: AppAssets.dessertIcon,
              categoryId: "000",
              categoryName: "All"));
      for (Category item in list) {
        filteredList.add(item);
      }
    }

    return filteredList;
  }
}

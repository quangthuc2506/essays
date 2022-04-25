import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/models/category.dart';
import 'package:essays/repository/category/base_category_reprository.dart';

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
}

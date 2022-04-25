import 'package:essays/models/category.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class LoadCategoriesEvent extends CategoryEvent {}

class UpdateCategoriesEvent extends CategoryEvent {
  final List<Category> categories;
  UpdateCategoriesEvent(this.categories);
}

part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class LoadingCategoryState extends CategoryState {}

class LoadedCategoryState extends CategoryState {
  final List<Category> categories;
  LoadedCategoryState({this.categories = const <Category>[]});
}

class CategoryErrorState extends CategoryState {
  final String message;
  CategoryErrorState(this.message);
}

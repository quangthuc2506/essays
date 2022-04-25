import 'package:bloc/bloc.dart';
import 'package:essays/models/category.dart';
import 'package:essays/repository/category/category_repository.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryBloc({required this.categoryRepository})
      : super(LoadingCategoryState()) {
    on<LoadCategoriesEvent>((event, emit) async {
      emit(LoadingCategoryState());
      try {
        categoryRepository.getAllCategories().listen((categories) {
          add(UpdateCategoriesEvent(categories));
        });
      } catch (e) {}
    });
    on<UpdateCategoriesEvent>((event, emit) {
      emit(LoadedCategoryState(categories: event.categories));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(LoadingProductSate()) {
    on<LoadHotProductEvent>((event, emit) async {
      try {
        productRepository.getHotProduct().listen((products) {
          add(UpdatedProductEvent(products));
        });
      } catch (e) {}
    });
    on<UpdatedProductEvent>((event, emit) async {
      emit(LoadedProductState(products: event.products));
    });

    on<LoadProductEvent>((event, emit) async {
      try {
        productRepository.getAllProduct().listen((products) {
          add(UpdatedProductEvent(products));
        });
      } catch (e) {}
    });
    on<SearchProductByNameEvent>((event, emit) async {
      try {
        await productRepository
            .searchProduct(productName: event.productName)
            .then((products) => add(UpdatedProductEvent(products)));
      } catch (e) {}
    });
    on<SearchByCategoryEvent>((event, emit) {
      productRepository
          .searchProductsByCategoryname(categoryName: event.categoryName)
          .listen((products) {
        return add(UpdatedProductEvent(products));
      });
    });
  }
}

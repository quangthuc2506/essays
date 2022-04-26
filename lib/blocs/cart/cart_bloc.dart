import 'package:bloc/bloc.dart';
import 'package:essays/models/cart.dart';
import 'package:essays/repository/cart/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(LoadingCartState()) {
    on<LoadCartsEvent>((event, emit) async {
      try {
        cartRepository.getAllCarts().listen((carts) {
          add(UpdatedCartsEvent(carts));
        });
      } catch (e) {}
    });
    on<UpdatedCartsEvent>((event, emit) async {
      emit(LoadedCartState(carts: event.carts));
    });
  }
}

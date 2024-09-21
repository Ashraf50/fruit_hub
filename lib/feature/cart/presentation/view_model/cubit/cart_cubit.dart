import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/feature/cart/presentation/view_model/cubit/cart_state.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(HomeInitial());
  static CartCubit get(context) => BlocProvider.of(context);

  List selectedProduct = [];
  double price = 0;
  bool discountActivated = false;

  add(FruitModel product) {
    selectedProduct.add(product);
    emit(UpdateSelectedProduct());
    price += product.price.round();
    emit(UpdatePrice());
  }

  delete(FruitModel product) {
    selectedProduct.remove(product);
    emit(UpdateSelectedProduct());
    price -= product.price.round();
    emit(UpdatePrice());
  }
}

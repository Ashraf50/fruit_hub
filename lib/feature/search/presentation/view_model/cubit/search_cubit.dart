import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';

class SearchCubit extends Cubit<List<FruitModel>> {
  SearchCubit() : super([]);

  void searchCategory(String query) {
    List<FruitModel> filteredCategory = state
        .where((product) => (product.name.toLowerCase().contains(query)))
        .toList();
    emit(filteredCategory);
  }
}

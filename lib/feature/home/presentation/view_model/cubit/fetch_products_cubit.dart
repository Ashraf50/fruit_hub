import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';
part 'fetch_products_state.dart';

class FetchProductsCubit extends Cubit<FetchProductsState> {
  FetchProductsCubit() : super(FetchProductsInitial());

  Future<void> loadFruitsData() async {
    emit(FetchProductLoading());
    try {
      final String jsonString = await rootBundle.loadString('assets/api.json');
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);
      final List<dynamic> fruitsJson = jsonResponse['fruits'];
      final List<FruitModel> fruits =
          fruitsJson.map((json) => FruitModel.fromJson(json)).toList();
      emit(FetchProductsSuccess(fruits: fruits));
    } on Exception {
      FetchProductsFailure(errMessage: "failed to fetch products");
    }
  }
}

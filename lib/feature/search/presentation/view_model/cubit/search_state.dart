import 'package:fruit_hub/feature/home/data/fruit_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  List<FruitModel> products;
  SearchSuccess(this.products);
}

class SearchFailure extends SearchState {}
part of 'fetch_products_cubit.dart';


sealed class FetchProductsState {}

final class FetchProductsInitial extends FetchProductsState {}

final class FetchProductLoading extends FetchProductsState {}

final class FetchProductsSuccess extends FetchProductsState {
  final List<FruitModel> fruits;
  FetchProductsSuccess({required this.fruits});
}

final class FetchProductsFailure extends FetchProductsState {
  final String errMessage;
  FetchProductsFailure({required this.errMessage});
}

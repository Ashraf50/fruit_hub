part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoritesLoading extends FavoriteState {}

class FavoritesSuccess extends FavoriteState {
  final List<Map<String, dynamic>> favorites;
  FavoritesSuccess({required this.favorites});
}

class FavoritesFailure extends FavoriteState {
  final String errorMessage;
  FavoritesFailure(this.errorMessage);
}

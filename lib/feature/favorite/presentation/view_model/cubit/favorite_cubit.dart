import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  Future<void> addFavoriteProduct({
    required String productName,
    required String productImage,
    required num productPrice,
    required String productDescription,
  }) async {
    await fireStore
        .collection('Users')
        .doc(user!.uid)
        .collection('favorites')
        .doc(productName)
        .set(
          {
            'product_name': productName,
            'product_img': productImage,
            'product_price': productPrice,
            'product_description': productDescription,
          },
        )
        .then(
          (value) => print("product data updated"),
        )
        .catchError((error) => print("Failed to add data: $error"));
  }

  Future<void> removeFavoriteProduct({required String productId}) async {
    await fireStore
        .collection('Users')
        .doc(user!.uid)
        .collection('favorites')
        .doc(productId)
        .delete()
        .then(
          (value) => print("product deleted"),
        )
        .catchError((error) => print("Failed to delete product: $error"));
  }

  Future<void> getFavoriteProducts() async {
    emit(FavoritesLoading());
    try {
      QuerySnapshot snapshot = await fireStore
          .collection('Users')
          .doc(user!.uid)
          .collection('favorites')
          .get();

      List<Map<String, dynamic>> favorites = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      emit(FavoritesSuccess(favorites: favorites));
    } catch (e) {
      emit(FavoritesFailure(e.toString()));
    }
  }

  Future<bool> isProductFavorite(String productId) async {
    try {
      DocumentSnapshot doc = await fireStore
          .collection('Users')
          .doc(user!.uid)
          .collection('favorites')
          .doc(productId)
          .get();

      return doc.exists;
    } catch (e) {
      print("Error checking favorite status: $e");
      return false;
    }
  }
}

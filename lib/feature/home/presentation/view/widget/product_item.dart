import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';
import '../../../../favorite/presentation/view_model/cubit/favorite_cubit.dart';

class ProductItem extends StatefulWidget {
  final FruitModel fruits;
  const ProductItem({
    super.key,
    required this.fruits,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    checkFavoriteStatus();
  }

  void checkFavoriteStatus() async {
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    bool favoriteStatus =
        await favoriteCubit.isProductFavorite(widget.fruits.name);
    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xffF3F5F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.asset(
                    widget.fruits.image,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 2,
                          widget.fruits.name,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${widget.fruits.price.toString()} EGP",
                          style: AppStyles.textStyle18amber,
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        cubit.add(widget.fruits);
                        showSnackBar(context, "Product added");
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColors.buttonColor,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
                final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
                if (isFavorite) {
                  favoriteCubit.addFavoriteProduct(
                    productName: widget.fruits.name,
                    productImage: widget.fruits.image,
                    productPrice: widget.fruits.price,
                    productDescription: widget.fruits.description,
                  );
                } else {
                  favoriteCubit.removeFavoriteProduct(
                      productId: widget.fruits.name);
                }
              },
              icon: isFavorite
                  ? const Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
            ),
          )
        ],
      ),
    );
  }
}

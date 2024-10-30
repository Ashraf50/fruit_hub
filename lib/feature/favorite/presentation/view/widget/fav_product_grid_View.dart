import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/feature/favorite/presentation/view/widget/favorite_product_item.dart';
import 'package:fruit_hub/feature/favorite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';
import 'package:fruit_hub/feature/home/presentation/view/widget/details_view_body.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transition;

class FavProductGridView extends StatefulWidget {
  const FavProductGridView({super.key});

  @override
  State<FavProductGridView> createState() => _FavProductGridViewState();
}

class _FavProductGridViewState extends State<FavProductGridView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..getFavoriteProducts(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoritesSuccess) {
            final favorites = state.favorites;
            if (favorites.isEmpty) {
              return NoFavoriteProduct(message: S.of(context).no_favorite);
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (MediaQuery.of(context).size.width ~/ 200).toInt(),
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];
                FruitModel fruitModel = FruitModel(
                  name: product["product_name"],
                  image: product["product_img"],
                  price: product["product_price"],
                  description: product["product_description"],
                );
                return InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Get.to(
                      () => DetailsViewBody(fruits: fruitModel),
                      transition: get_transition.Transition.zoom,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  child: FavProductItem(
                    productName: product["product_name"],
                    productImage: product["product_img"],
                    productPrice: product["product_price"],
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          context.read<FavoriteCubit>().removeFavoriteProduct(
                              productId: product["product_name"]);
                          favorites.removeAt(index);
                        });
                      }
                    },
                  ),
                );
              },
            );
          } else if (state is FavoritesFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.buttonColor,
            ));
          }
        },
      ),
    );
  }
}

class NoFavoriteProduct extends StatelessWidget {
  final String message;
  const NoFavoriteProduct({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/img/info-circle.svg",
            height: MediaQuery.sizeOf(context).width * .3),
        const SizedBox(
          height: 10,
        ),
        Text(
          message,
          style: AppStyles.textStyle18,
        ),
      ],
    );
  }
}

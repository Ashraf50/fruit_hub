import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/feature/favorite/presentation/view/widget/fav_product_grid_View.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: "Favorite"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: const [
            SizedBox(
              height: 20,
            ),
            FavProductGridView(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

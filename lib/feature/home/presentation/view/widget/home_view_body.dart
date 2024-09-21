import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/feature/home/presentation/view/widget/custom_search_box.dart';
import 'package:fruit_hub/feature/home/presentation/view/widget/home_app_bar.dart';
import 'package:fruit_hub/feature/home/presentation/view/widget/products_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: const [
            SizedBox(
              height: 15,
            ),
            HomeAppBar(),
            SizedBox(
              height: 16,
            ),
            CustomSearchBox(),
            SizedBox(
              height: 16,
            ),
            Text(
              "Best seller",
              style: AppStyles.textStyle20,
            ),
            SizedBox(
              height: 16,
            ),
            ProductsGridView(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
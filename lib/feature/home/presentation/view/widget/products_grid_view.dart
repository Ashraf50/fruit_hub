import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/favorite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:fruit_hub/feature/home/presentation/view/widget/product_item.dart';
import 'package:fruit_hub/feature/home/presentation/view_model/cubit/fetch_products_cubit.dart';
import 'package:go_router/go_router.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: BlocBuilder<FetchProductsCubit, FetchProductsState>(
        builder: (context, state) {
          if (state is FetchProductsSuccess) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (MediaQuery.of(context).size.width ~/ 200).toInt(),
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.fruits.length,
              itemBuilder: (context, index) {
                return InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      context.push('/details_view', extra: state.fruits[index]);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: ProductItem(fruits: state.fruits[index]));
              },
            );
          } else if (state is FetchProductsFailure) {
            return showSnackBar(context, state.errMessage);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/feature/cart/presentation/view/widget/cart_item.dart';
import 'package:fruit_hub/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/favorite/presentation/view/widget/fav_product_grid_View.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/cubit/cart_state.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        if (cubit.selectedProduct.isEmpty) {
          return NoFavoriteProduct(message: S.of(context).No_products_in_cart);
        } else {
          return ListView.builder(
            itemCount: cubit.selectedProduct.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  context.push('/details_view',
                      extra: cubit.selectedProduct[index]);
                },
                child: CartItem(
                  fruit: cubit.selectedProduct[index],
                ),
              );
            },
          );
        }
      },
    );
  }
}

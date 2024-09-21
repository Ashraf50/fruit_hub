import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/feature/cart/presentation/view/widget/cart_list_view.dart';
import 'package:fruit_hub/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/cart/presentation/view_model/cubit/cart_state.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: const CustomAppBar(title: "Cart"),
            body: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: const Color(0xffEBF9F1),
                  child: Center(
                    child: Text(
                      "You have ${cubit.selectedProduct.length} products in your shopping cart.",
                      style: const TextStyle(
                        color: AppColors.buttonColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CartListView(),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                title: "Pay ${cubit.price} pounds",
                onTap: () {},
                buttonColor: AppColors.buttonColor,
                textColor: Colors.white,
                width: double.infinity,
              ),
            ),
          ),
        );
      },
    );
  }
}

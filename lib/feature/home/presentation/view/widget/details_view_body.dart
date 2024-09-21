import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';

class DetailsViewBody extends StatelessWidget {
  final FruitModel fruits;
  const DetailsViewBody({
    super.key,
    required this.fruits,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffF3F5F7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(220, 80),
                    bottomRight: Radius.elliptical(220, 80),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    fruits.image,
                    height: 200,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 20,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  fruits.name,
                  style: AppStyles.textStyle20,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${fruits.price.toString()} EGP",
                  style: AppStyles.textStyle18amber,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  fruits.description,
                  style: AppStyles.textStyle18,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: CustomButton(
          title: "Add to cart",
          onTap: () {
            cubit.add(fruits);
            showSnackBar(context, "Product added");
          },
          buttonColor: AppColors.buttonColor,
          textColor: Colors.white,
          width: double.infinity,
        ),
      ),
    );
  }
}

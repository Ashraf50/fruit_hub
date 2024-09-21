import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';

class FavProductItem extends StatelessWidget {
  final String productName;
  final String productImage;
  final num productPrice;
  final void Function() onPressed;
  const FavProductItem({
    super.key,
    required this.onPressed,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    FruitModel fruitModel = FruitModel(
      name: productName,
      image: productImage,
      price: productPrice.toInt(),
      description: "description",
    );
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
                    productImage,
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
                          productName,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${productPrice.toString()} EGP",
                          style: AppStyles.textStyle18amber,
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        cubit.add(fruitModel);
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
              onPressed: onPressed,
              icon: const Icon(
                Icons.favorite_rounded,
                color: Colors.red,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}

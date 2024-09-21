import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';

class CartItem extends StatelessWidget {
  final FruitModel fruit;
  const CartItem({
    super.key,
    required this.fruit,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 92,
                  width: 73,
                  decoration: const BoxDecoration(
                    color: Color(0xffF3F5F7),
                  ),
                  child: Expanded(
                    child: Image.asset(
                      fruit.image,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                Row(
                  children: [
                    Text(
                      fruit.name,
                      style: AppStyles.textStyle20,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () => cubit.delete(fruit),
                  child: SvgPicture.asset(
                    "assets/img/trash.svg",
                    height: 30,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "${fruit.price} pounds",
                  style: AppStyles.textStyle18amber,
                )
              ],
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}

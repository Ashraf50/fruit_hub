import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';

class SearchItem extends StatelessWidget {
  final FruitModel product;
  const SearchItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.4),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Row(
        children: [
          Radio(
            value: "",
            groupValue: "",
            activeColor: AppColors.buttonColor,
            onChanged: (index) {},
          ),
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(right: 5),
            child: Expanded(child: Image.asset(product.image)),
          ),
          Expanded(
            child: Text(
              (product.name),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.buttonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

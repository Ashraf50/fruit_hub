import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';

class CheckAccount extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final void Function() onPressed;
  const CheckAccount({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 19,
              color: AppColors.buttonColor,
            ),
          ),
        )
      ],
    );
  }
}

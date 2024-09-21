import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';

class ButtonDesign extends StatelessWidget {
  final String image;
  final String title;
  final void Function() onTap;
  final bool isLoading;
  const ButtonDesign({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: isLoading
              ? const SpinKitWave(
                  color: AppColors.buttonColor,
                  size: 20,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgPicture.asset(
                      image,
                      height: 25,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

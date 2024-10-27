import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/feature/registration/presentation/view/sign_in_view.dart';
import 'package:get/get.dart';

class SplashView2 extends StatelessWidget {
  final double horizontal;
  const SplashView2({super.key, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('assets/img/fruit_basket.svg'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "FruitHUB",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF9CE81),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and high quality.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: "start now",
              textColor: Colors.white,
              buttonColor: AppColors.buttonColor,
              width: double.infinity,
              onTap: () {
                Get.to(
                  () => const SignInView(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 500),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:go_router/go_router.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).welcome,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
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
            Text(
              S.of(context).description,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: S.of(context).start,
              textColor: Colors.white,
              buttonColor: AppColors.buttonColor,
              width: double.infinity,
              onTap: () {
                context.push('/signInView');
              },
            )
          ],
        ),
      ),
    );
  }
}

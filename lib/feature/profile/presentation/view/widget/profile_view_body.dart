import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/feature/cart/presentation/view/cart_view.dart';
import 'package:fruit_hub/feature/favorite/presentation/view/favorite_view.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/custom_list_tile.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/header_content.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/language_view.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/perssonal_information_view.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/who_are_you.dart';
import 'package:fruit_hub/feature/registration/presentation/view/sign_in_view.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:get/get.dart';

class ProfileViewBody extends StatelessWidget {
  final double horizontal;
  const ProfileViewBody({super.key, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).My_Profile),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal),
        child: ListView(
          children: [
            const HeaderContent(),
            const SizedBox(
              height: 18,
            ),
            Text(
              S.of(context).general,
              style: AppStyles.textStyle20,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomListTile(
              title: S.of(context).profile,
              image: "assets/img/profile.svg",
              onTap: () {
                Get.to(
                  () => LayoutBuilder(builder: (context, constraints) {
                    if (constraints.maxWidth < 600) {
                      return const PersonalInformationView(
                        horizontal: 20,
                      );
                    } else {
                      return PersonalInformationView(
                        horizontal: MediaQuery.sizeOf(context).width * .2,
                      );
                    }
                  }),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                );
              },
            ),
            CustomListTile(
              title: S.of(context).orders,
              image: "assets/img/order.svg",
              onTap: () {
                Get.to(
                  () => const CartView(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                );
              },
            ),
            CustomListTile(
              title: S.of(context).payment,
              image: "assets/img/empty-wallet.svg",
              onTap: () {},
            ),
            CustomListTile(
              title: S.of(context).Favorite,
              image: "assets/img/favorite.svg",
              onTap: () {
                Get.to(
                  () => const FavoriteView(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                );
              },
            ),
            CustomListTile(
              title: S.of(context).notification,
              image: "assets/img/notification.svg",
              onTap: () {},
            ),
            CustomListTile(
              title: S.of(context).language,
              image: "assets/img/global.svg",
              onTap: () {
                Get.to(
                  () => const LanguageView(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                );
              },
            ),
            CustomListTile(
              title: S.of(context).dark_mode,
              image: "assets/img/magicpen.svg",
              onTap: () {},
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              S.of(context).help,
              style: AppStyles.textStyle20,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomListTile(
              title: S.of(context).who_we_are,
              image: "assets/img/info-circle.svg",
              onTap: () {
                Get.to(
                  () => const HowAreYouView(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                );
              },
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButton(
              width: double.infinity,
              title: S.of(context).logout,
              onTap: () {
                customDialog(context);
              },
              buttonColor: const Color(0xffEBF9F1),
              textColor: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  customDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).want_to_logout,
                textAlign: TextAlign.center,
                style: AppStyles.textStyle20,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    title: S.of(context).back,
                    width: 100,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonColor: const Color(0xffEBF9F1),
                    textColor: AppColors.buttonColor,
                  ),
                  CustomButton(
                    title: S.of(context).logout,
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ),
                          (route) => false);
                    },
                    buttonColor: AppColors.buttonColor,
                    textColor: Colors.white,
                    width: 125,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

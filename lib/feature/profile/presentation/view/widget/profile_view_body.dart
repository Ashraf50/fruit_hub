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
import 'package:fruit_hub/feature/profile/presentation/view/widget/perssonal_information_view.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/who_are_you.dart';
import 'package:fruit_hub/feature/registration/presentation/view/sign_in_view.dart';
import 'package:get/get.dart';

class ProfileViewBody extends StatelessWidget {
  final double horizontal;
  const ProfileViewBody({super.key, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: "My Profile"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal),
        child: ListView(
          children: [
            const HeaderContent(),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "General",
              style: AppStyles.textStyle20,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomListTile(
              title: "Profile",
              image: "assets/img/profile.svg",
              onTap: () {
                Get.to(() => const PersonalInformationView(
                      horizontal: 20,
                    ));
              },
            ),
            CustomListTile(
              title: "Orders",
              image: "assets/img/order.svg",
              onTap: () {
                Get.to(() => const CartView());
              },
            ),
            CustomListTile(
              title: "Payment",
              image: "assets/img/empty-wallet.svg",
              onTap: () {},
            ),
            CustomListTile(
              title: "Favorite",
              image: "assets/img/favorite.svg",
              onTap: () {
                Get.to(() => const FavoriteView());
              },
            ),
            CustomListTile(
              title: "notifications",
              image: "assets/img/notification.svg",
              onTap: () {},
            ),
            CustomListTile(
              title: "Language",
              image: "assets/img/global.svg",
              onTap: () {},
            ),
            CustomListTile(
              title: "Dark-Mode",
              image: "assets/img/magicpen.svg",
              onTap: () {},
            ),
            const SizedBox(
              height: 22,
            ),
            const Text(
              "Help",
              style: AppStyles.textStyle20,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomListTile(
              title: "Who we are",
              image: "assets/img/info-circle.svg",
              onTap: () {
                Get.to(() => const HowAreYouView());
              },
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButton(
              width: double.infinity,
              title: "Logout",
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
              const Text(
                "Do you want to logout?",
                textAlign: TextAlign.center,
                style: AppStyles.textStyle20,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    title: "Back",
                    width: 100,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonColor: const Color(0xffEBF9F1),
                    textColor: AppColors.buttonColor,
                  ),
                  CustomButton(
                    title: "Logout",
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
                    width: 100,
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

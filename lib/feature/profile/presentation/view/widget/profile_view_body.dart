import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/custom_list_tile.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/header_content.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:go_router/go_router.dart';

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
                context.push('/personalInfo');
              },
            ),
            CustomListTile(
              title: S.of(context).orders,
              image: "assets/img/order.svg",
              onTap: () {
                context.push('/cart_view');
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
                context.push('/fav_view');
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
                context.push('/language_view');
              },
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
                context.push('/howAreYouView');
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
                      context.pop(context);
                    },
                    buttonColor: const Color(0xffEBF9F1),
                    textColor: AppColors.buttonColor,
                  ),
                  CustomButton(
                    title: S.of(context).logout,
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      context.go('/signInView');
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

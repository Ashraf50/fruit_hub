import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/feature/cart/presentation/view/cart_view.dart';
import 'package:fruit_hub/feature/home/presentation/view/home_view.dart';
import 'package:fruit_hub/feature/favorite/presentation/view/favorite_view.dart';
import 'package:fruit_hub/feature/profile/presentation/view/profile_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  changeItem(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  List pages = [
    const HomeView(),
    const FavoriteView(),
    const CartView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: changeItem,
        items: [
          SalomonBottomBarItem(
            icon: SvgPicture.asset("assets/img/home.svg", height: 25),
            title: const Text("Home"),
            selectedColor: AppColors.buttonColor,
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset("assets/img/favorite.svg", height: 25),
            title: const Text("Favorite"),
            selectedColor: AppColors.buttonColor,
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset("assets/img/cart.svg", height: 25),
            title: const Text("Cart"),
            selectedColor: AppColors.buttonColor,
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset("assets/img/profile.svg", height: 25),
            title: const Text("Profile"),
            selectedColor: AppColors.buttonColor,
          ),
        ],
      ),
    );
  }
}

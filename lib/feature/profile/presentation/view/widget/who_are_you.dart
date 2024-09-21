import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';

class HowAreYouView extends StatelessWidget {
  const HowAreYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: "Who Are you"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: const [
            SizedBox(
              height: 20,
            ),
            Text(
              "At FruitHub, we are passionate about delivering the freshest and finest fruits straight to your doorstep. We believe in the power of natural nutrition and are committed to offering a wide variety of handpicked, farm-fresh fruits that promote a healthy and vibrant lifestyle. Our team works closely with trusted local farmers and suppliers to ensure every fruit meets the highest quality standards.Our mission is to make healthy eating convenient and accessible to everyone. Whether you’re looking to stock up on your favorites or try something new, FruitHub is here to simplify your fruit shopping experience. With a seamless app interface, quick delivery options, and a commitment to sustainability, we bring nature’s bounty to your table with just a few taps.Join us in our journey to create a healthier, happier community—one fruit at a time!",
              style: AppStyles.textStyle17,
            ),
          ],
        ),
      ),
    );
  }
}

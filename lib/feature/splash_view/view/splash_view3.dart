import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/widget/botom_bar.dart';

class SplashView3 extends StatefulWidget {
  const SplashView3({super.key});

  @override
  State<SplashView3> createState() => _SplashView3State();
}

class _SplashView3State extends State<SplashView3> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const BottomBar(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/img/leafs.svg"),
          Center(
            child: SvgPicture.asset(
              'assets/img/fruit_hub.svg',
              height: 250,
            ),
          )
        ],
      ),
    );
  }
}

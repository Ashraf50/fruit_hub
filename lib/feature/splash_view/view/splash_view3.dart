import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/widget/botom_bar.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
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

class SplashView3 extends StatefulWidget {
  const SplashView3({super.key});

  @override
  State<SplashView3> createState() => _SplashView3State();
}

class _SplashView3State extends State<SplashView3>
    with SingleTickerProviderStateMixin {
  double ballY = 0;
  double widthVal = 50;
  double heightVal = 50;
  double bottomVal = 500;
  bool add = false;
  bool showShadow = false;
  int times = 0;
  bool showComic = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(
            () {
              if (add) {
                ballY += 15;
              } else {
                ballY -= 15;
              }
              if (ballY <= -200) {
                times += 1;
                add = true;
                showShadow = true;
              }
              if (ballY >= 0) {
                add = false;
                showShadow = false;
                widthVal += 50;
                heightVal += 50;
                bottomVal -= 200;
              }
              if (times == 3) {
                showShadow = false;
                widthVal = 200;
                heightVal = 200;
                Timer(const Duration(milliseconds: 300), () {
                  setState(() {
                    showComic = true;
                  });
                });
                _controller.stop();
              }
              setState(() {});
            },
          );
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return CustomScaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              bottom: bottomVal,
              duration: const Duration(milliseconds: 600),
              child: Column(
                children: [
                  Transform.translate(
                    offset: Offset(0, ballY),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 200),
                      scale: times == 3 ? 5 : 1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: widthVal,
                        height: heightVal,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.buttonColor),
                      ),
                    ),
                  ),
                  if (showShadow)
                    Container(
                      width: 50,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.2),
                          borderRadius: BorderRadius.circular(100)),
                    )
                ],
              ),
            ),
            if (showComic) const SplashView()
          ],
        ),
      ),
    );
  }
}

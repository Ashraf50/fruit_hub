import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/feature/splash_view/view/splash_view2.dart';

class SplashView1 extends StatefulWidget {
  const SplashView1({super.key});

  @override
  State<SplashView1> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SplashView2(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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

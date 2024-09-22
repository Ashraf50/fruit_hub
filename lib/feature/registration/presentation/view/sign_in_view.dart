import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const SignInViewBody(horizontal: 20,);
      } else {
        return  SignInViewBody(horizontal: MediaQuery.sizeOf(context).width * .2,);
      }
    });
  }
}

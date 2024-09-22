import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const SignUpViewBody(
          horizontal: 20,
        );
      } else {
        return SignUpViewBody(
          horizontal: MediaQuery.sizeOf(context).width * .2,
        );
      }
    });
  }
}

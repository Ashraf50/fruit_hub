import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const ForgetPasswordViewBody(
          horizontal: 20,
        );
      } else {
        return ForgetPasswordViewBody(
          horizontal: MediaQuery.sizeOf(context).width * .2,
        );
      }
    });
  }
}

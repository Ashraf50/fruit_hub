import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const ProfileViewBody(
            horizontal: 16,
          );
        } else {
          return ProfileViewBody(
            horizontal: MediaQuery.sizeOf(context).width * .2,
          );
        }
      },
    );
  }
}

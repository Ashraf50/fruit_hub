import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widget/botom_bar.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/button_design.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/google_facebook_bloc/google_facebook_bloc.dart';
import 'package:get/get.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<GoogleFacebookBloc, GoogleFacebookState>(
      listener: (context, state) {
        if (state is GooglSignLoading) {
          isLoading = true;
        } else if (state is GooglSignSuccess) {
          Get.to(() => const BottomBar());
          showSnackBar(context, "Welcome");
          isLoading = false;
        } else if (state is GooglSignFailure) {
          isLoading = false;
          showSnackBar(context, state.messageError);
        }
      },
      builder: (context, state) {
        return ButtonDesign(
          image: "assets/img/google.svg",
          title: "Sign in with google",
          onTap: () {
            BlocProvider.of<GoogleFacebookBloc>(context).add(GoogleSignEvent());
          },
          isLoading: isLoading,
        );
      },
    );
  }
}

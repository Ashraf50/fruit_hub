import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widget/botom_bar.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/button_design.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/google_facebook_bloc/google_facebook_bloc.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:get/get.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<GoogleFacebookBloc, GoogleFacebookState>(
      listener: (context, state) {
        if (state is FacebookSignLoading) {
          isLoading = true;
        } else if (state is FacebookSignSuccess) {
          Get.to(() => const BottomBar());
          showSnackBar(context, "Welcome");
          isLoading = false;
        } else if (state is FacebookSignFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ButtonDesign(
          image: "assets/img/facebook.svg",
          title: S.of(context).sign_with_facebook,
          onTap: () async {
            BlocProvider.of<GoogleFacebookBloc>(context)
                .add(FacebookSignEvent());
          },
          isLoading: isLoading,
        );
      },
    );
  }
}

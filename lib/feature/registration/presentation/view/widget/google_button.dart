import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/button_design.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/google_facebook_bloc/google_facebook_bloc.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:go_router/go_router.dart';

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
          context.go('/bottomBar');
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
          title: S.of(context).sign_with_google,
          onTap: () {
            BlocProvider.of<GoogleFacebookBloc>(context).add(GoogleSignEvent());
          },
          isLoading: isLoading,
        );
      },
    );
  }
}

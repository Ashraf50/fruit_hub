import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/core/widget/custom_text_field.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/check_account.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../sign_in_view.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transition;

class ForgetPasswordViewBody extends StatefulWidget {
  final double horizontal;
  const ForgetPasswordViewBody({super.key, required this.horizontal});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final emailController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ResetLoading) {
          isLoading = true;
        } else if (state is ResetSuccess) {
          Get.to(() => const SignInView());
          showSnackBar(context, "email sent");
          isLoading = false;
        } else if (state is ResetFailure) {
          isLoading = false;
          showSnackBar(context, state.messageError);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.buttonColor),
          ),
          inAsyncCall: isLoading,
          child: CustomScaffold(
            appBar: const CustomAppBar(title: "Forget Password"),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.horizontal),
              child: ListView(
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    "Don't worry, just enter your email and we will send you the verification link.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextfield(
                    hintText: "your email",
                    obscureText: false,
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: "forget password",
                    textColor: Colors.white,
                    onTap: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        ResetEvent(email: emailController.text),
                      );
                    },
                    buttonColor: AppColors.buttonColor,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 20),
                  CheckAccount(
                    title: "Remember password?",
                    buttonTitle: "sign in",
                    onPressed: () {
                      Get.to(
                        () => const SignInView(),
                        transition: get_transition.Transition.leftToRight,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

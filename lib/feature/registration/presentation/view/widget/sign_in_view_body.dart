import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/widget/botom_bar.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/google_button.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/core/widget/custom_text_field.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/facebook_button.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/registration/presentation/view/forget_password_view.dart';
import 'package:fruit_hub/feature/registration/presentation/view/sign_up_view.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/check_account.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visibility = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomBar(),
            ),
            (route) => false,
          );
          showSnackBar(context, "Welcome");
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.buttonColor),
          ),
          child: CustomScaffold(
            appBar: const CustomAppBar(title: "Sign In"),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 24),
                    CustomTextfield(
                      validator: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? "Enter a valid email"
                            : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hintText: "your email",
                      obscureText: false,
                      controller: emailController,
                    ),
                    CustomTextfield(
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Your password is too short!";
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hintText: "your password",
                      obscureText: visibility,
                      controller: passwordController,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                        icon: visibility
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to(() => const ForgetPasswordView());
                          },
                          child: const Text(
                            "forget Password?",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.buttonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      title: "Sign in",
                      textColor: Colors.white,
                      buttonColor: AppColors.buttonColor,
                      width: double.infinity,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                        } else {
                          showSnackBar(context, "check the email or password");
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    CheckAccount(
                      title: "don't have an account?",
                      buttonTitle: "crete account",
                      onPressed: () {
                        Get.to(() => const SignUpView());
                      },
                    ),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Text(
                          "     OR     ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const GoogleButton(),
                    const FacebookButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

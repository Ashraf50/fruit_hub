import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/google_button.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/core/widget/custom_text_field.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/facebook_button.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/check_account.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInViewBody extends StatefulWidget {
  final double horizontal;
  const SignInViewBody({super.key, required this.horizontal});

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
          context.go('/bottomBar');
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
            appBar: CustomAppBar(title: S.of(context).sign_in),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.horizontal),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 24),
                    CustomTextfield(
                      validator: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? S.of(context).valid_email
                            : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hintText: S.of(context).your_email,
                      obscureText: false,
                      controller: emailController,
                    ),
                    CustomTextfield(
                      validator: (value) {
                        if (value!.length < 6) {
                          return S.of(context).short_password;
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hintText: S.of(context).your_Password,
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
                            context.push('/forgetPassword');
                          },
                          child: Text(
                            S.of(context).forget_password,
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.buttonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      title: S.of(context).sign_in,
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
                      title: S.of(context).do_have_account,
                      buttonTitle: S.of(context).create_account,
                      onPressed: () {
                        context.push('/signUnView');
                      },
                    ),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Text(
                          S.of(context).or,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Expanded(child: Divider()),
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

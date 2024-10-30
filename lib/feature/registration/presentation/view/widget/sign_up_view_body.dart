import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/core/widget/custom_text_field.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/registration/presentation/view/sign_in_view.dart';
import 'package:fruit_hub/feature/registration/presentation/view/widget/check_account.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transition;

class SignUpViewBody extends StatefulWidget {
  final double horizontal;
  const SignUpViewBody({super.key, required this.horizontal});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visibility = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Get.to(() => const SignInView());
          showSnackBar(context, "Register success");
          isLoading = false;
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnackBar(context, state.messageError);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.buttonColor),
          ),
          child: CustomScaffold(
            appBar: CustomAppBar(title: S.of(context).new_account),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.horizontal),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 24),
                    CustomTextfield(
                      hintText: S.of(context).your_name,
                      obscureText: false,
                      controller: nameController,
                    ),
                    CustomTextfield(
                      validator: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? S.of(context).valid_email
                            : null;
                      },
                      hintText: S.of(context).your_email,
                      obscureText: false,
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    const SizedBox(height: 20),
                    CustomButton(
                      title: S.of(context).create_new_account,
                      textColor: Colors.white,
                      buttonColor: AppColors.buttonColor,
                      width: double.infinity,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            RegisterEvent(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        } else {
                          showSnackBar(context, "check the email or password");
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    CheckAccount(
                      title: S.of(context).already_have_account,
                      buttonTitle: S.of(context).sign_in,
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
          ),
        );
      },
    );
  }
}

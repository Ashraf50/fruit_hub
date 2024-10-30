import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_button.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/core/widget/custom_text_field.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PersonalInformationView extends StatefulWidget {
  final double horizontal;
  const PersonalInformationView({super.key, required this.horizontal});

  @override
  State<PersonalInformationView> createState() =>
      _PersonalInformationViewState();
}

class _PersonalInformationViewState extends State<PersonalInformationView> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UpdateLoading) {
          isLoading = true;
        } else if (state is UpdateSuccess) {
          customDialog(context, emailController.text);
          isLoading = false;
        } else if (state is UpdateFailure) {
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
            appBar: CustomAppBar(title: S.of(context).profile),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.horizontal),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      S.of(context).personal_inform,
                      style: AppStyles.textStyle20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).Enter_name;
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hintText: S.of(context).new_name,
                      obscureText: false,
                      suffixIcon: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      controller: usernameController,
                    ),
                    CustomTextfield(
                      validator: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? S.of(context).valid_email
                            : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hintText: S.of(context).new_email,
                      obscureText: false,
                      suffixIcon: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      S.of(context).change_pass,
                      style: AppStyles.textStyle20,
                    ),
                    const SizedBox(
                      height: 10,
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
                      hintText: S.of(context).new_pass,
                      obscureText: false,
                      suffixIcon: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      title: S.of(context).save_changes,
                      buttonColor: AppColors.buttonColor,
                      textColor: Colors.white,
                      width: double.infinity,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            UpdateEvent(
                              email: emailController.text,
                              username: usernameController.text,
                              password: passwordController.text,
                            ),
                          );
                        } else {
                          showSnackBar(context, S.of(context).check_email);
                        }
                      },
                    )
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

customDialog(BuildContext context, String newEmail) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Please verify the new email by clicking the link was sent to $newEmail",
              textAlign: TextAlign.center,
              style: AppStyles.textStyle20,
            ),
            const SizedBox(height: 30),
            SvgPicture.asset("assets/img/verify.svg"),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}

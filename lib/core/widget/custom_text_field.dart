import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  const CustomTextfield({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.obscureText,
    required this.controller,
    this.autovalidateMode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: validator,
        autovalidateMode: autovalidateMode,
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.grey,
        style: const TextStyle(color: Colors.black, fontSize: 17),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textfieldColor,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xff949D9E)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

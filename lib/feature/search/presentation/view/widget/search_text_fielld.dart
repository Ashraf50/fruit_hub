import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/text_style.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const SearchTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.5),
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        controller: controller,
        cursorColor: Colors.grey,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: AppStyles.textStyle18,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Colors.grey,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

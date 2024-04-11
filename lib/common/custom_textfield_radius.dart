import 'package:flutter/material.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType,
    this.obscureText,
    this.hintText,
    this.suffixIcon,
    required this.controller,
    this.validator,
    required this.borderRadius,
    this.isError,
    this.isLoading,
    this.prefixIcon,
  });
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double borderRadius;
  final bool? isError;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: appStyle(14, Color(kMidGrey.value), FontWeight.w500),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.red, width: 0.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide:
                  BorderSide(color: Color(klightBlue.value), width: 0.5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.red, width: 0.5)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide:
                  BorderSide(color: Color(kLightGrey.value), width: 0.5)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: Color(klightBlue.value), width: 0),
          ),
        ),
        controller: controller,
        cursorHeight: 20,
        style: appStyle(14, Color(kDark.value), FontWeight.w500),
        validator: validator,
      ),
    );
  }
}

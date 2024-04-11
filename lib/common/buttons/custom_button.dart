import 'package:flutter/material.dart';
import 'package:job_studio/constansts/app_constants.dart';

import '../app_style.dart';
import '../reusable_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    required this.text,
    required this.width,
    this.onTap,
    required this.textColor,
    this.backgroundColor,
    required this.radius,
    this.borderColor,
    this.isLoading,
  });
  final String text;
  final double height;
  final double width;
  final Function()? onTap;
  final Color textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double radius;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border:
              Border.all(width: 1, color: borderColor ?? Color(kLight.value)),
        ),
        child: isLoading ?? false
            ? Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: textColor,
                    strokeWidth: 2,
                  ),
                ),
              )
            : Center(
                child: ReusableText(
                  style: appStyle(14, textColor, FontWeight.normal),
                  text: text,
                ),
              ),
      ),
    );
  }
}

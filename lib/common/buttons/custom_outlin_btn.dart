import 'package:flutter/material.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/reusable_text.dart';

class CustomoutlineButton extends StatelessWidget {
  const CustomoutlineButton({super.key,required this.height,required this.text,required this.width,this.onTap,required this.color1, this.color2,required this.radius,});
  final String text;
  final double height;
  final double width;
  final Function()? onTap;
  final Color color1;
  final Color? color2;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color2,
          border: Border.all(
            width: 1,
            color: color1,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: ReusableText(style: appStyle(16, color1, FontWeight.w600),text: text,),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/reusable_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      this.text,
      this.actions,
      required this.child,
      this.color,
      this.textColor});
  final String? text;
  final Widget child;
  final List<Widget>? actions;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(),
      backgroundColor: color,
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: child,
      actions: actions,
      centerTitle: true,
      title: ReusableText(
        style: appStyle(16, textColor ?? Color(kDark.value), FontWeight.w600),
        text: text ?? "",
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/reusable_text.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableText(
          text: text,
          style: appStyle(14, Color(kDark.value), FontWeight.w300),
        ),
        GestureDetector(
          onTap: onTap,
          child: ReusableText(
            text: "View all",
            style: appStyle(12, Color(kPink.value), FontWeight.normal),
          ),
        ),
      ],
    );
  }
}

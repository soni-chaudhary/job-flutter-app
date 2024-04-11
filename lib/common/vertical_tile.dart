import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/reusable_text.dart';
import 'package:job_studio/common/width_spacer.dart';

class VerticalTile extends StatelessWidget {
  const VerticalTile(
      {super.key,
      this.onTap,
      required this.companyName,
      required this.jonTitle,
      required this.locationOfJob,
      required this.salary,
      required this.periodOfSalary});
  final Function()? onTap;
  final String companyName;
  final String jonTitle;
  final String locationOfJob;
  final String salary;
  final String periodOfSalary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          width: width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(kLightGrey.value),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/thirdpage.jpg"),
                    ),
                    const WidthSpacer(size: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                            text: companyName,
                            style: appStyle(
                                20, Color(kDark.value), FontWeight.w500)),
                        ReusableText(
                            text: jonTitle,
                            style: appStyle(
                                17, Color(kDarkBlue.value), FontWeight.normal)),
                      ],
                    ),
                    const WidthSpacer(size: 30),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(kLight.value),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(kPink.value),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const HeightSpacer(size: 20),
                Row(
                  children: [
                    ReusableText(
                        text: salary,
                        style: appStyle(
                            16, Color(kDarkBlue.value), FontWeight.normal)),
                    ReusableText(
                        text: periodOfSalary,
                        style: appStyle(
                            16, Color(kMidGrey.value), FontWeight.normal)),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

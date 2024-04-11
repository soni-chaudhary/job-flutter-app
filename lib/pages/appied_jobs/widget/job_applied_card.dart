import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/reusable_text.dart';
import 'package:job_studio/common/width_spacer.dart';

import '../../../constansts/app_constants.dart';

class JobAppliedCardWidget extends StatelessWidget {
  const JobAppliedCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 223, 223, 223),
            blurRadius: 3.0,
          ),
        ],
        color: Color(kLight.value),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // const CircleAvatar(
                  //   radius: 16,
                  //   backgroundImage: AssetImage("images/company_icon.jpg"),
                  // ),
                  Container(
                    height: 30.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: Color(kLight.value),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 223, 223, 223),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    child: const Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child:
                            Image(image: AssetImage("images/company_icon.jpg"))
                        // CircleAvatar(
                        //   backgroundImage: AssetImage("images/company_icon.jpg"),
                        // ),
                        ),
                  ),
                  const WidthSpacer(size: 10),
                  ReusableText(
                      text: "Company Name",
                      style: appStyle(15, Color(kDark.value), FontWeight.w500)),
                ],
              ),
              ReusableText(
                  text: "28/01/2023",
                  style:
                      appStyle(12, Color(kMidGrey.value), FontWeight.normal)),
            ],
          ),
          const HeightSpacer(size: 5),
          ReusableText(
              text: "Flutter Developer",
              style: appStyle(12, Color(kDarkGrey.value), FontWeight.normal)),
          const HeightSpacer(size: 5),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(kLightbackground.value),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, bottom: 2, top: 2),
                  child: ReusableText(
                      text: "Full Time",
                      style: appStyle(
                          11, Color(kDarkBlue.value), FontWeight.normal)),
                ),
              ),
              const WidthSpacer(size: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(kLightbackground.value),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, bottom: 2, top: 2),
                  child: ReusableText(
                      text: "Onsite",
                      style: appStyle(
                          11, Color(kDarkBlue.value), FontWeight.normal)),
                ),
              ),
              const WidthSpacer(size: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(kLightbackground.value),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, bottom: 2, top: 2),
                  child: ReusableText(
                      text: "0-3 Years",
                      style: appStyle(
                          11, Color(kDarkBlue.value), FontWeight.normal)),
                ),
              ),
            ],
          ),
          const HeightSpacer(size: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/electric.svg",
                          height: 15, width: 15, color: Color(kDarkGrey.value)),
                      const WidthSpacer(size: 5),
                      ReusableText(
                          text: "On progrese",
                          style: appStyle(
                              10, Color(kDarkGrey.value), FontWeight.normal)),
                    ],
                  ),
                  const WidthSpacer(size: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.work_outline,
                        color: Color(kDarkBlue.value),
                        size: 15,
                      ),
                      const WidthSpacer(size: 5),
                      ReusableText(
                          text: "Job",
                          style: appStyle(
                              10, Color(kDarkGrey.value), FontWeight.normal)),
                    ],
                  ),
                ],
              ),
              const HeightSpacer(size: 30),
              Container(
                height: 24,
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(kPink.value)),
                child: Center(
                  child: Text("Applied",
                      style:
                          appStyle(10, Color(kLight.value), FontWeight.normal)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

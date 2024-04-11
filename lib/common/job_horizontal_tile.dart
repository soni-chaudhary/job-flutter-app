import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/reusable_text.dart';
import 'package:job_studio/common/width_spacer.dart';

class JobHorizontalTile extends StatelessWidget {
  const JobHorizontalTile({
    super.key,
    this.onTap,
    required this.companyName,
    required this.jonTitle,
    required this.locationOfJob,
    required this.salary,
    required this.periodOfSalary,
    required this.isBookmark,
    required this.isBookmarkFunction,
  });
  final Function()? onTap;
  final String companyName;
  final String jonTitle;
  final String locationOfJob;
  final String salary;
  final String periodOfSalary;
  final bool isBookmark;
  final Function()? isBookmarkFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            width: width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 223, 223, 223),
                  blurRadius: 8.0,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("images/freepikcompany.png"),
                              ),
                            ),
                          ),
                          const WidthSpacer(size: 15),
                          ReusableText(
                              text: companyName,
                              style: appStyle(13, Color(kMidGrey.value),
                                  FontWeight.normal)),
                        ],
                      ),
                      GestureDetector(
                        onTap: isBookmarkFunction,
                        child: isBookmark
                            ? Icon(
                                Icons.bookmark_border,
                                color: Color(kMidGrey.value),
                              )
                            : Icon(
                                Icons.bookmark,
                                color: Color(kPink.value),
                              ),
                      ),
                    ],
                  ),
                  const HeightSpacer(size: 8),
                  ReusableText(
                      text: jonTitle,
                      style: appStyle(14, Color(kDark.value), FontWeight.w500)),
                  const HeightSpacer(size: 8),
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
                              style: appStyle(11, Color(kDarkBlue.value),
                                  FontWeight.normal)),
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
                              style: appStyle(11, Color(kDarkBlue.value),
                                  FontWeight.normal)),
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
                              style: appStyle(11, Color(kDarkBlue.value),
                                  FontWeight.normal)),
                        ),
                      ),
                    ],
                  ),
                  const HeightSpacer(size: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(kDarkBlue.value),
                        size: 15,
                      ),
                      ReusableText(
                          text: locationOfJob,
                          style: appStyle(
                              12, Color(kDarkBlue.value), FontWeight.normal)),
                    ],
                  ),
                  const HeightSpacer(size: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ReusableText(
                              text: salary,
                              style: appStyle(12, Color(kDarkBlue.value),
                                  FontWeight.normal)),
                          ReusableText(
                              text: periodOfSalary,
                              style: appStyle(12, Color(kMidGrey.value),
                                  FontWeight.normal)),
                        ],
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(klightBlue.value),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(kLight.value),
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

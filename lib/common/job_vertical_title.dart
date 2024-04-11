import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/reusable_text.dart';
import 'package:job_studio/common/width_spacer.dart';

class JobVerticalTile extends StatelessWidget {
  const JobVerticalTile({
    super.key,
    this.onTap,
    required this.companyName,
    required this.jonTitle,
    required this.locationOfJob,
    required this.salary,
    required this.periodOfSalary,
    this.image,
    required this.postJobDate,
    // required this.isBookmarkFunction,
    this.isBookmarks,
  });
  final Function()? onTap;
  final String companyName;
  final String jonTitle;
  final String locationOfJob;
  final String salary;
  final String periodOfSalary;
  final String? image;
  final String postJobDate;
  final bool? isBookmarks;
  // final Function()? isBookmarkFunction;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          child: (image != null)
                              ? Image.network(image ?? "")
                              : const Icon(Icons.ac_unit_rounded),
                          // backgroundImage:
                          //     AssetImage("images/company_icon.jpg"),
                        ),
                        const WidthSpacer(size: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                                text: jonTitle,
                                style: appStyle(
                                    13, Color(kDark.value), FontWeight.normal)),
                            ReusableText(
                                text: periodOfSalary,
                                style: appStyle(10, Color(kMidGrey.value),
                                    FontWeight.w500)),
                            ReusableText(
                                text: companyName,
                                style: appStyle(11, Color(kMidGrey.value),
                                    FontWeight.normal)),
                            const HeightSpacer(size: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Color(kMidGrey.value),
                                      size: 12,
                                    ),
                                    ReusableText(
                                        text: locationOfJob,
                                        style: appStyle(
                                            10,
                                            Color(kMidGrey.value),
                                            FontWeight.normal)),
                                    const WidthSpacer(size: 10),
                                    Icon(
                                      Icons.watch_later_outlined,
                                      color: Color(kMidGrey.value),
                                      size: 11,
                                    ),
                                    ReusableText(
                                        text: postJobDate,
                                        style: appStyle(
                                            10,
                                            Color(kMidGrey.value),
                                            FontWeight.normal)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                            //  isBookmarks? isBookmarkFunction!():null;
                            },
                            child: isBookmarks??false
                                ? Icon(
                                    Icons.bookmark,
                                    color: Color(kPink.value),
                                  )
                                : Icon(
                                    Icons.bookmark_border,
                                    color: Color(kMidGrey.value),
                                  )),
                        const HeightSpacer(size: 30),
                        Container(
                          height: 24,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(kPink.value)),
                          child: Center(
                            child: Text("Apply",
                                style: appStyle(10, Color(kLight.value),
                                    FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

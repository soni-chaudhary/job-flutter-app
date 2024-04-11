import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/width_spacer.dart';
import 'package:job_studio/pages/device%20Management/device_widget/alertdialog.dart';

class DeviceWidget extends StatelessWidget {
  const DeviceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            // barrierDismissible: true,
            context: context,
            builder: (_) => const DeviceManagementAlertDialog());
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        height: 65.h,
        decoration: BoxDecoration(
          color: Color(kLight.value),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(kLightGrey.value),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: Color(kSkyBlue.value),
                            child:
                                SvgPicture.asset("assets/mobile_device.svg")),
                        const WidthSpacer(size: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DeviceName",
                              style: appStyle(
                                  14, Color(kDark.value), FontWeight.bold),
                            ),
                            Text(
                              "Last Active at",
                              style: appStyle(
                                  11, Color(kMidGrey.value), FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "logout",
                          style: appStyle(
                              11, Color(kPink.value), FontWeight.normal),
                        ),
                        const WidthSpacer(size: 5),
                        Icon(
                          Icons.logout,
                          color: Color(kPink.value),
                          size: 12,
                        ),
                      ],
                    ),

                    // CircleAvatar(
                    //   radius: 10,
                    //   backgroundColor: Color(kPink.value),
                    //   child: Icon(
                    //     Icons.arrow_forward_ios,
                    //     color: Color(kLight.value),
                    //     size: 12,
                    //   ),
                    // ),
                  ],
                ),
                const HeightSpacer(size: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

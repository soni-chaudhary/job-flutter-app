import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/pages/device%20Management/device_widget/device_widget.dart';

import '../../controllers/drawer/drawer_widget.dart';
import '../../common/app_bar.dart';

class DeviceManagementPage extends StatefulWidget {
  const DeviceManagementPage({super.key});

  @override
  State<DeviceManagementPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<DeviceManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            text: "Device Management",
            color: Color(kLight.value),
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: const DrawerWidget(),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
        child: Column(children: [
          Text(
            "You are logged in into your account on this device",
            style: appStyle(16, Color(kDark.value), FontWeight.w400),
          ),
          const HeightSpacer(size: 20),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return const DeviceWidget();
                }),
          )
        ]),
      ),
    );
  }
}

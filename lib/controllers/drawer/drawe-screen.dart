import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/controllers/zoom_provider.dart';
import 'package:provider/provider.dart';

import '../../common/app_style.dart';
import '../../common/reusable_text.dart';
import '../../common/width_spacer.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter indexSetter;
  const DrawerScreen({super.key, required this.indexSetter});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomProvider>(builder: (contex, zoomNotifer, child) {
      return GestureDetector(
        onDoubleTap: () {
          ZoomDrawer.of(context)!.toggle();
        },
        child: Scaffold(
            backgroundColor: Color(kDarkBlue.value),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                drawerItem(
                  Icons.home,
                  "Home",
                  0,
                  zoomNotifer.currentIndex == 0
                      ? Color(kLight.value)
                      : Color(kMidGrey.value),
                ),
                drawerItem(
                  Icons.chat_bubble_outline_rounded,
                  "Chat",
                  1,
                  zoomNotifer.currentIndex == 1
                      ? Color(kLight.value)
                      : Color(kMidGrey.value),
                ),
                drawerItem(
                  Icons.bookmark_border,
                  "Bookmarks",
                  2,
                  zoomNotifer.currentIndex == 2
                      ? Color(kLight.value)
                      : Color(kMidGrey.value),
                ),
                drawerItem(
                  Icons.devices,
                  "Device management",
                  3,
                  zoomNotifer.currentIndex == 3
                      ? Color(kLight.value)
                      : Color(kMidGrey.value),
                ),
                drawerItem(
                  Icons.person_sharp,
                  "profile",
                  4,
                  zoomNotifer.currentIndex == 4
                      ? Color(kLight.value)
                      : Color(kMidGrey.value),
                ),
                drawerItem(
                  Icons.work_outline,
                  "Appied jobs",
                  5,
                  zoomNotifer.currentIndex == 5
                      ? Color(kLight.value)
                      : Color(kMidGrey.value),
                ),
              ],
            )),
      );
    });
  }

  Widget drawerItem(
    IconData icon,
    String text,
    int index,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        widget.indexSetter(index);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w, bottom: 20.h),
        child: Row(children: [
          Icon(
            icon,
            color: color,
          ),
          const WidthSpacer(size: 12),
          ReusableText(text: text, style: appStyle(12, color, FontWeight.bold))
        ]),
      ),
    );
  }
}

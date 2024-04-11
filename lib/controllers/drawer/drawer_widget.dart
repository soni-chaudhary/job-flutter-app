import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerWidget extends StatelessWidget {
  final Color? color;
  const DrawerWidget({super.key,this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ZoomDrawer.of(context)!.toggle();
      },
      child: SvgPicture.asset(
                "assets/menu-circle-3.svg",
                height: 30.h,
                width: 30.w,
                color: color,
              ),
    );
  }
}
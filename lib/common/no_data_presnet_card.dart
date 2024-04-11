import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/constansts/app_constants.dart';

class NoDataPresentWidget extends StatelessWidget {
  const NoDataPresentWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const HeightSpacer(size: 10),
            SvgPicture.asset(
              "assets/nodata.svg",
            ),
            Text(text,
                style: appStyle(16.0, Color(kMidGrey.value), FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}

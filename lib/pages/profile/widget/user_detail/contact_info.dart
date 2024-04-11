import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_studio/common/width_spacer.dart';

import '../../../../common/app_style.dart';
import '../../../../common/height_spacer.dart';
import '../../../../common/reusable_text.dart';
import '../../../../constansts/app_constants.dart';

class ContactDetailWidget extends StatelessWidget {
  const ContactDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableText(
              text: "Mikal Jordan",
              style: appStyle(16, Color(kDark.value), FontWeight.bold),
            ),
            SvgPicture.asset(
              "assets/pen.svg",
              width: 20,
              height: 20,
              color: Color(kMidGrey.value),
            )
          ],
        ),
        const HeightSpacer(size: 5),
        Row(
          children: [
            Icon(
              Icons.email,
              color: Color(kMidGrey.value),
              size: 15,
            ),
            const WidthSpacer(size: 5),
            ReusableText(
              text: "mikaljordan@gmail.com",
              style: appStyle(12, Color(klightBlue.value), FontWeight.normal),
            ),
          ],
        ),
        const HeightSpacer(size: 5),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: Color(kMidGrey.value),
              size: 15,
            ),
            const WidthSpacer(size: 5),
            ReusableText(
              text: "+91 9735342672",
              style: appStyle(12, Color(kMidGrey.value), FontWeight.normal),
            ),
          ],
        ),
        const HeightSpacer(size: 2),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Color(kMidGrey.value),
              size: 15,
            ),
            const WidthSpacer(size: 5),
            ReusableText(
              text: "Meerut",
              style: appStyle(12, Color(kMidGrey.value), FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }
}

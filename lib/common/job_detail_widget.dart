import 'package:flutter/material.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';

import '../constansts/app_constants.dart';

class JobDetailWidget extends StatelessWidget {
  const JobDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeightSpacer(size: 10),
        Text(
          "About this Job",
          style: appStyle(16, Color(kDark.value), FontWeight.w600),
        ),
        const HeightSpacer(size: 5),
        Text(
          "A role description explains the work an employee is expected to perform. It covers the activities and accountability of the person who fills the role, as well as the skills, knowledge and characteristics required.",
          style: appStyle(12, Color(kMidGrey.value), FontWeight.normal),
        ),
        const HeightSpacer(size: 10),
        Text(
          "In the short term, you will",
          style: appStyle(16, Color(kDark.value), FontWeight.w600),
        ),
        const HeightSpacer(size: 5),
        Text(
          "A role description explains the work an employee is expected to perform. It covers the activities and accountability of the person who fills the role, as well as the skills, knowledge and characteristics required.",
          style: appStyle(12, Color(kMidGrey.value), FontWeight.normal),
        ),
      ],
    );
  }
}

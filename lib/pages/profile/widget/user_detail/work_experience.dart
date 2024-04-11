import 'package:flutter/material.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/reusable_text.dart';
import 'package:job_studio/common/width_spacer.dart';

import '../../../../constansts/app_constants.dart';

class WorkExperience extends StatelessWidget {
  const WorkExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) =>const WorkStepper(
        index: 2,
        discription: '',
        timing: '',
        title: '',
      ),
    );
  }
}

class WorkStepper extends StatelessWidget {
  final Function()? onTap;
  final int index;
  final String timing;
  final String discription;
  final String title;
  const WorkStepper(
      {super.key,
      this.onTap,
      required this.index,
      required this.timing,
      required this.discription,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color(kPink.value),
            border: Border.all(color: Color(kPink.value)),
          ),
        ),
        const WidthSpacer(size: 25),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
                text: "Woring name",
                style: appStyle(15, Colors.grey.shade700, FontWeight.w500)),
            ReusableText(
                text: "Woring name",
                style: appStyle(10, Color(kMidGrey.value), FontWeight.normal)),
            ReusableText(
                text: "March 2014-May 2016(1 year 2 months)",
                style: appStyle(10, Color(kMidGrey.value), FontWeight.normal)),
          ],
        )
      ],
    );
  }
}

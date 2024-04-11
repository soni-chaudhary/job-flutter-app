import 'package:flutter/material.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/height_spacer.dart';

import '../../../common/app_style.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kLight.value),
        child: Column(children: [
          const HeightSpacer(size: 100),
          Image.asset(
            "images/onbordingpage3.jpg",
          ),
          const HeightSpacer(size: 10),
          Text(
            "Stable Yourself with \n your ability",
            textAlign: TextAlign.center,
            style: appStyle(24, Color(kDarkBlue.value), FontWeight.bold),
          ),
          const HeightSpacer(size: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "We help you to fine jobs according to your skills, location and prefrence to build your career",
              textAlign: TextAlign.center,
              style: appStyle(12, Color(kDarkGrey.value), FontWeight.normal),
            ),
          )
        ]),
      ),
    );
  }
}

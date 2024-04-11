import 'package:flutter/material.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kLight.value),

        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Color.fromARGB(255, 232, 215, 207),
        //       Color.fromARGB(255, 242, 233, 228),
        //     ],
        //     end: Alignment.bottomCenter,
        //     begin: Alignment.topCenter,
        //     stops: [
        //       0.5,
        //       0.5,
        //     ],
        //   ),
        // ),
        child: Column(
          children: [
            const HeightSpacer(size: 100),
            Image.asset(
              "images/as1.jpg",
            ),
            // const HeightSpacer(size: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeightSpacer(size: 25),
                Text(
                  "Hire candidates according to your \ncompany requirements",
                  textAlign: TextAlign.center,
                  style: appStyle(20, Color(kDarkBlue.value), FontWeight.bold),
                ),
                const HeightSpacer(size: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "We help you to fine able employes according to your comapany requirements",
                    textAlign: TextAlign.center,
                    style:
                        appStyle(12, Color(kDarkGrey.value), FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

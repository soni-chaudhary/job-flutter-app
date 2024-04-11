import 'package:flutter/material.dart';
import 'package:job_studio/constansts/app_constants.dart';
import '../../../common/app_style.dart';
import '../../../common/height_spacer.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var loginNotifier = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: const Color.fromARGB(255, 247, 247, 247),
        child: Column(
          children: [
            const HeightSpacer(size: 120),
            Text(
              "Welcome to Job Studio \nApp",
              textAlign: TextAlign.center,
              style: appStyle(20, Color(kDarkBlue.value), FontWeight.bold),
            ),
            const HeightSpacer(size: 30),
            SizedBox(
              height: MediaQuery.of(context).size.height - 560,
              child: Expanded(
                child: Image.asset(
                  "images/onbordingpage1.jpg",
                ),
              ),
            ),
            const HeightSpacer(size: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeightSpacer(size: 20),
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

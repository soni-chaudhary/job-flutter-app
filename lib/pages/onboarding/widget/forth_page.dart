import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/pages/auth/company_register_pages/signup_first_page.dart';
import 'package:job_studio/pages/auth/signup-page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/app_style.dart';
import '../../../common/height_spacer.dart';
import '../../../util/prefrences_const.dart';
import '../../../constansts/app_constants.dart';

class ForthPage extends StatelessWidget {
  const ForthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(kLight.value),
              Color(kLight.value),
              Color(kLight.value),
              Color(kDarkBlue.value),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            // stops: const [0, 0.1, 0.7, 0.9],
          ),
        ),
        child: Column(
          children: [
            const HeightSpacer(size: 80),
            Text(
              "Welcome to Our App",
              textAlign: TextAlign.center,
              style: appStyle(18, Color(kDarkBlue.value), FontWeight.bold),
            ),
            const HeightSpacer(size: 10),
            Image.asset(
              "images/as.jpg",
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    "How can we help \n you?",
                    textAlign: TextAlign.center,
                    style:
                        appStyle(18, Color(kDarkBlue.value), FontWeight.bold),
                  ),
                ),
                const HeightSpacer(size: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: ()async {
                            SharedPreferences pref=await SharedPreferences.getInstance();
                            pref.setBool(PreferencesConstants.ENTRYPOINT, true);
                            Get.toNamed(RegisterPage.routeName);
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(kDarkBlue.value),
                            radius: 50,
                            child: Container(
                              margin: const EdgeInsets.all(1.0),
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Color(kLight.value),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "images/meeting.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                        const HeightSpacer(size: 10),
                        Text(
                          "Staring Working",
                          textAlign: TextAlign.center,
                          style: appStyle(
                              12, Color(kLight.value), FontWeight.normal),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async{
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.setBool(PreferencesConstants.ENTRYPOINT, true);
                            Get.toNamed(SignUpByCompanyFirstPage.routeName);
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(kDarkBlue.value),
                            radius: 50,
                            child: Container(
                              margin: const EdgeInsets.all(1.0),
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Color(kLight.value),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "images/people_icon.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                        const HeightSpacer(size: 10),
                        Text(
                          "Staring Hiring",
                          textAlign: TextAlign.center,
                          style: appStyle(
                              12, Color(kLight.value), FontWeight.normal),
                        )
                      ],
                    ),
                  ],
                ),
                const HeightSpacer(size: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/pages/profile/custom_stepper.dart';

import '../../../common/app_bar.dart';
import '../../../common/buttons/custom_button.dart';
import '../../../constansts/app_constants.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
            textColor: Color(kDark.value),
            color: Color(kLightbackground.value),
            text: "Edit Profile Details",
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: Color(kDark.value)),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: CustomButton(
            backgroundColor: Color(kPink.value),
            height: 50,
            text: "Next",
            width: MediaQuery.of(context).size.width,
            textColor: Color(kLight.value),
            radius: 5),
      ),
      body: const CustomStepper(),
    );
  }
}

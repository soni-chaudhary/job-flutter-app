import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/common/app_bar.dart';

import '../../../constansts/app_constants.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
            textColor: Color(kLight.value),
            color: Color(kPink.value),
            text: "Company name",
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: Color(kLight.value)),
            )),
      ),
      body: ListView(children: []),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_studio/pages/appied_jobs/widget/job_applied_card.dart';
import '../../common/app_bar.dart';
import '../../constansts/app_constants.dart';
import '../../controllers/drawer/drawer_widget.dart';

class AppliedJobList extends StatelessWidget {
  const AppliedJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
            textColor: Color(kLight.value),
            color: Color(kPink.value),
            text: "APPLIED JOBS",
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: DrawerWidget(
                color: Color(kLight.value),
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              JobAppliedCardWidget(),
              // const NoDataPresentWidget(
              //   text: "No Data Present",
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/pages/search/user_serch_job.dart';

import '../../common/app_bar.dart';
import '../../common/app_style.dart';
import '../../common/height_spacer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
            textColor: Color(kLight.value),
            color: Color(kPink.value),
            text: "SEARCH",
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: Color(kLight.value)),
            )),
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchWidgetText(
              backgroundColor: Color(kLightbackground.value),
              text: "search job",
              controller: searchController,
            )),
        const HeightSpacer(size: 20),
        Image.asset(
          "images/people_search.png",
        ),
        const HeightSpacer(size: 30),
        Text("No Present Data",
            style: appStyle(15, Color(kMidGrey.value), FontWeight.normal)),
      ]),
    );
  }
}

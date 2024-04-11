import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../common/app_bar.dart';
import '../../../common/job_vertical_title.dart';
import '../../../constansts/app_constants.dart';

class UserInterestedJobList extends StatefulWidget {
  static const routeName = "/interestedJob";
  const UserInterestedJobList({super.key});

  @override
  State<UserInterestedJobList> createState() => _UserInterestedJobListState();
}

class _UserInterestedJobListState extends State<UserInterestedJobList> {
  List bookmarkList = [
    {
      "_id": "659e42baacbd46caff80780a",
      "job": "Node js",
      "company": "Microsoft",
      "location": "Mumbie",
      "job_title": "Node developer",
      "description": "qwertyuihjvajhcvjhv odfghjk",
      "salary": "90000",
      "period": "monthaly",
      "contract": "9148277221",
      "requirement": ["Java", "Node jas", "Js"],
      "postJobDate": "4-12-23",
      "imageUrl": "https://picsum.photos/250?image=9",
      "agentId": "659e39baeaec21b8d10e0285",
    },
    {
      "_id": "659e42baacbd46caff80780a",
      "job": "Dart developer ",
      "company": "Google",
      "job_title": "Senior Flutter developer",
      "location": "Noida",
      "description": "qwertyuiodfghjk",
      "salary": "50000",
      "period": "monthaly",
      "contract": "9148225221",
      "requirement": ["flutter", "comunication", "dart"],
      "postJobDate": "12-12-23",
      "imageUrl": "http://via.placeholder.com/350x150",
      "agentId": "659e39baeaec21b8d10e0285"
    },
    {
      "_id": "659e42baacbd46caff80780a",
      "job": "Node js",
      "company": "Microsoft",
      "location": "Mumbie",
      "job_title": "Node developer",
      "description": "qwertyuihjvajhcvjhv odfghjk",
      "salary": "90000",
      "period": "monthaly",
      "contract": "9148277221",
      "requirement": ["Java", "Node jas", "Js"],
      "postJobDate": "4-12-23",
      "imageUrl": "https://picsum.photos/250?image=9",
      "agentId": "659e39baeaec21b8d10e0285",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
            textColor: Color(kLight.value),
            color: Color(kPink.value),
            text: "RECENTLY POST JOB",
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: Color(kLight.value)),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: height * 0.50,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: bookmarkList.length,
              itemBuilder: (context, i) {
                return JobVerticalTile(
                  image: bookmarkList[i]["imageUrl"],
                  companyName: bookmarkList[i]["company"],
                  jonTitle: bookmarkList[i]["job_title"],
                  locationOfJob: bookmarkList[i]["location"],
                  salary: bookmarkList[i]["salary"],
                  periodOfSalary: bookmarkList[i]["period"],
                  postJobDate: bookmarkList[i]["postJobDate"],
                  onTap: () {
                    // Get.to(() => JobDetailPage(
                    //       companyName: bookmarkList[i]["company"],
                    //     ));
                  },
                );
              }),
        ),
      ),
    );
  }
}

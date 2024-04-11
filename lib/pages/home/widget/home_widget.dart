import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/pages/home/widget/recently_post_view_page.dart';
import 'package:job_studio/pages/home/widget/user_interested_job.dart';
import 'package:job_studio/pages/jobs/job_page.dart';
import 'package:provider/provider.dart';
import '../../../constansts/app_constants.dart';
import '../../../common/heading_widget.dart';
import '../../../common/height_spacer.dart';
import '../../../common/job_horizontal_tile.dart';
import '../../../common/job_vertical_title.dart';
import '../../../controllers/bookmark_provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key, required this.data});
  final String data;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
    }
  ];
  @override
  Widget build(BuildContext context) {
    var bookmarkNotifer = Provider.of<BookMarkProvider>(context);
    return Column(
      children: [
        const HeightSpacer(size: 30),
        HeadingWidget(
          text: "Recently Posted",
          onTap: () {
            Get.toNamed(RecentlyPostViewPage.routeName);
          },
        ),
        const HeightSpacer(size: 10),
        SizedBox(
          height: height * 0.23,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return JobHorizontalTile(
                  companyName: widget.data,
                  jonTitle: "Senior Flutter developer",
                  locationOfJob: "Noida",
                  salary: "50k",
                  periodOfSalary: "/Monthaly",
                  isBookmark: bookmarkNotifer.isBookmark,
                  isBookmarkFunction: () {
                    bookmarkNotifer.isBookmark = !bookmarkNotifer.isBookmark;
                  },
                  onTap: () {
                    Get.to(() => const JobDetailPage(
                          companyName: "facebook",
                        ));
                  },
                );
              }),
        ),
        const HeightSpacer(size: 20),
        HeadingWidget(
          text: "Job matches your interest",
          onTap: () {
            Get.toNamed(UserInterestedJobList.routeName);
          },
        ),
        const HeightSpacer(size: 10),
        SizedBox(
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
                  // isBookmarks: widget.bookmarkNotifer.isBookmark,
                  // isBookmarkFunction: () {
                  //   widget.bookmarkNotifer.isBookmark =
                  //       !widget.bookmarkNotifer.isBookmark;
                  // },
                  onTap: () {
                    Get.to(() => JobDetailPage(
                          companyName: bookmarkList[i]["company"],
                        ));
                  },
                );
              }),
        ),
      ],
    );
  }
}

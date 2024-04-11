import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/controllers/drawer/drawer_widget.dart';
import 'package:job_studio/common/app_bar.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/pages/home/widget/home_widget.dart';
import 'package:job_studio/pages/search/search_page.dart';
import 'package:job_studio/pages/search/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> jobName = [
    "All",
    "Design",
    "Tech",
    "Besiness",
    "Marketing",
    "Sales",
    "accounting",
  ];
  int pageNo = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          color: Color(kLight.value),
          actions: [
            Padding(
              padding: EdgeInsets.all(5.h),
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("images/man.jpg"),
              ),
            ),
          ],
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpacer(size: 5),
                    Text(
                      "Hellow, userName",
                      style: appStyle(10, Color(kDark.value), FontWeight.w600),
                    ),
                    const HeightSpacer(size: 3),
                    Text(
                      "Find your deam job",
                      style: appStyle(18, Color(kDark.value), FontWeight.w600),
                    ),
                    const HeightSpacer(size: 20),
                    SearchWidget(
                      text: "Search for jobs",
                      onTap: () {
                        Get.to(() => const SearchPage());
                      },
                    ),
                  ],
                ),
                const HeightSpacer(size: 20),
                Text(
                  "Recommendaion",
                  style: appStyle(16, Color(kDark.value), FontWeight.w600),
                ),
                const HeightSpacer(size: 10),
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: jobName.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Color(klightBlue.value)),
                                color: pageNo == index
                                    ? Color(kDarkBlue.value)
                                    : Color(kLight.value),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(index);
                                },
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(
                                    jobName[index],
                                    style: appStyle(
                                        12,
                                        pageNo == index
                                            ? Color(kLight.value)
                                            : Color(klightBlue.value),
                                        FontWeight.normal),
                                  ),
                                )),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      onPageChanged: (page) {
                        setState(() {
                          pageNo = page;
                        });
                      },
                      children: const <Widget>[
                        HomeWidget(
                          data: "All",
                        ),
                        HomeWidget(
                          data: "Design",
                        ),
                        HomeWidget(
                          data: "Tech",
                        ),
                        HomeWidget(
                          data: "Besiness",
                        ),
                        HomeWidget(
                          data: "Marketing",
                        ),
                        HomeWidget(
                          data: "Sales",
                        ),
                        HomeWidget(
                          data: "accounting",
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

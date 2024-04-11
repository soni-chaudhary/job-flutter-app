import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/common/app_bar.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/buttons/custom_button.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/reusable_text.dart';
import 'package:job_studio/common/width_spacer.dart';

import '../../constansts/app_constants.dart';
import '../../common/job_detail_widget.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key, required this.companyName});
  final String companyName;

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  List<String> discription = [
    "Description",
    "Map",
    "Company",
    "Review",
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
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.bookmark_outline),
              ),
            ],
            text: "JOB DETAIL",
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back),
            )),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: CustomButton(
            backgroundColor: Color(kPink.value),
            height: 50,
            text: "Apply Now",
            width: MediaQuery.of(context).size.width,
            textColor: Color(kLight.value),
            radius: 5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      color: Color(kLight.value),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 223, 223, 223),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("images/freepikcompany.png"),
                      ),
                    ),
                  ),
                ],
              ),
              const HeightSpacer(size: 10),
              ReusableText(
                  text: "Product designer",
                  style: appStyle(16, Color(kDark.value), FontWeight.w600)),
              const HeightSpacer(size: 3),
              ReusableText(
                  text: "Meta",
                  style: appStyle(12, Color(kMidGrey.value), FontWeight.w600)),
              const HeightSpacer(size: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.place_outlined,
                    color: Color(klightBlue.value),
                  ),
                  ReusableText(
                    text: "NewYork . inSile",
                    style:
                        appStyle(12, Color(kDarkGrey.value), FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Color(klightBlues.value),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        child: Text(
                          "Senior ",
                          style: appStyle(
                              12, Color(kDarkBlue.value), FontWeight.normal),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              const HeightSpacer(size: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(kLight.value),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 238, 238, 238),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      JobColumnData(
                        icon: Icons.home_repair_service,
                        text: "Applicents",
                        title: "160",
                        iconColor: Color(kDarkPurple.value),
                        backgroundColor: Color(
                          kLightPurple.value,
                        ),
                      ),
                      const WidthSpacer(size: 70),
                      JobColumnData(
                        icon: Icons.watch_later_outlined,
                        text: "Job Type",
                        title: "Full Time",
                        iconColor: Color(kDarkOrange.value),
                        backgroundColor: Color(
                          kLightOrange.value,
                        ),
                      ),
                      const WidthSpacer(size: 70),
                      JobColumnData(
                        icon: Icons.currency_rupee_sharp,
                        text: "Salaries",
                        title: " ₹30K-50K",
                        iconColor: Color(kDarkGreen.value),
                        backgroundColor: Color(
                          kLightGreen.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpacer(size: 30),
              SizedBox(
                height: 25,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: discription.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(klightBlue.value)),
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
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              discription[index],
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
              const HeightSpacer(size: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: PageView(
                    children: <Widget>[
                      JobDetailWidget(),
                    ],
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (page) {
                      setState(() {
                        pageNo = page;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobColumnData extends StatelessWidget {
  const JobColumnData({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
    required this.iconColor,
    required this.backgroundColor,
  });
  final String text;
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        HeightSpacer(size: 5.h),
        ReusableText(
          text: text,
          style: appStyle(9, Color(kMidGrey.value), FontWeight.normal),
        ),
        ReusableText(
          text: title,
          style: appStyle(12, Color(kDarkGrey.value), FontWeight.bold),
        ),
      ],
    );
  }
}

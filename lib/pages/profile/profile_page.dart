import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/width_spacer.dart';
import 'package:job_studio/pages/profile/widget/profile_detail_widget.dart';
import 'package:job_studio/pages/profile/widget/profile_edit_page.dart';
import 'package:job_studio/pages/profile/widget/user_detail/contact_info.dart';
import 'package:job_studio/pages/profile/widget/user_detail/skill.dart';

import '../../common/buttons/custom_button.dart';
import '../../controllers/drawer/drawer_widget.dart';
import '../../common/app_bar.dart';
import 'widget/user_detail/work_experience.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const ProfileEditPage());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 20),
                child: SvgPicture.asset(
                  "assets/edit.svg",
                  height: 25,
                  width: 25,
                ),
              ),
            )
          ],
          color: Color(kLight.value),
          text: "Profile",
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        child: CustomButton(
            backgroundColor: Color(kPink.value),
            height: 50,
            text: "Logout",
            width: MediaQuery.of(context).size.width,
            textColor: Color(kLight.value),
            radius: 5),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(kLight.value),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(kDarkBlue.value),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(1.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("images/man.jpg"),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35,
                          left: 35,
                          child: CircleAvatar(
                            backgroundColor: Color(kDarkBlue.value),
                            radius: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SvgPicture.asset(
                                "assets/pen.svg",
                                height: 25,
                                width: 25,
                                color: Color(kLight.value),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    WidthSpacer(size: 20.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mikal Jordan",
                          style:
                              appStyle(16, Color(kDark.value), FontWeight.bold),
                        ),
                        Text(
                          "wertyuiopghjkltyu ghjkisnbjwvdx",
                          style: appStyle(
                              10, Color(kMidGrey.value), FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // const HeightSpacer(size: 20),
            Divider(
              height: 1,
              color: Color(kLightGrey.value),
            ),
            const HeightSpacer(size: 20),
            // const ContactInfoWidget(
            //   text: "Contect Information",
            //   icon: "assets/contact.svg",
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 350,
              child: const SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  ContactInfoWidget(
                    text: "Contect Information",
                    icon: "assets/contact.svg",
                    widgets: ContactDetailWidget(),
                  ),
                  ContactInfoWidget(
                    text: "Skill",
                    icon: "assets/skill.svg",
                    widgets: SkillDetailWidget(),
                  ),
                  ContactInfoWidget(
                    text: "Work Experience",
                    icon: "assets/work.svg",
                    widgets: WorkExperience(),
                  ),
                  ContactInfoWidget(
                    text: "Expected Salary",
                    icon: "assets/salary.svg",
                  ),
                  ContactInfoWidget(
                    text: "Education",
                    icon: "assets/education.svg",
                  ),
                  ContactInfoWidget(
                    text: "Projects",
                    icon: "assets/project.svg",
                  ),
                  ContactInfoWidget(
                    text: "Certification & Licenses",
                    icon: "assets/certification.svg",
                  ),
                  ContactInfoWidget(
                    text: "Summary",
                    icon: "assets/summary.svg",
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

 // Container(
  //             height: 200,
  //             decoration: BoxDecoration(
  //               color: Color(kDarkBlue.value),
  //               borderRadius: const BorderRadius.only(
  //                   bottomRight: Radius.circular(10),
  //                   bottomLeft: Radius.circular(10)),
  //             ),
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 20.w),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   const HeightSpacer(size: 60),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       DrawerWidget(
  //                         color: Color(kLight.value),
  //                       ),
  //                       const CircleAvatar(
  //                         radius: 25,
  //                         backgroundImage: AssetImage("images/man.jpg"),
  //                       ),
  //                     ],
  //                   ),
  //                   const HeightSpacer(size: 20),
  //                   SearchWidget(
  //                     text: "Search for jobs",
  //                     isHomePage: true,
  //                     onTap: () {
  //                       Get.to(() => const SearchPage());
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
         

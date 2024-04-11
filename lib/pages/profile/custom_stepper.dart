import 'package:flutter/material.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/pages/profile/widget/user_profile_page/experience_project_detail.dart';
import 'package:job_studio/pages/profile/widget/user_profile_page/skills_salary_detail.dart';
import 'package:job_studio/pages/profile/widget/user_profile_page/user_education_certi.dart';
import 'package:provider/provider.dart';
import '../../controllers/custom_stepper_provider.dart';
import 'widget/user_profile_page/user_personal_detail.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  final PageController _pageController = PageController();
  int pageNo = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomStepperProvider>(
        builder: (contex, stepperNotifer, child) {
      return Scaffold(
        body: Container(
          color: Color(kLightbackground.value),
          child: Column(
            children: [
              const HeightSpacer(size: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    StepperComponent(
                      text: "Perstion Detail",
                      currentIndex: stepperNotifer.currentIndex,
                      index: 0,
                      onTap: () {
                        stepperNotifer.currentIndex = 0;
                        _pageController.jumpToPage(0);
                      },
                    ),
                    StepperComponent(
                      text: "Skills & Salary",
                      currentIndex: stepperNotifer.currentIndex,
                      index: 1,
                      onTap: () {
                        stepperNotifer.currentIndex = 1;
                        _pageController.jumpToPage(1);
                      },
                    ),
                    StepperComponent(
                      text: "Work Experience",
                      currentIndex: stepperNotifer.currentIndex,
                      index: 2,
                      onTap: () {
                        stepperNotifer.currentIndex = 2;
                        _pageController.jumpToPage(2);
                      },
                    ),
                    StepperComponent(
                      text: "Education",
                      currentIndex: stepperNotifer.currentIndex,
                      index: 3,
                      isLast: true,
                      onTap: () {
                        stepperNotifer.currentIndex = 3;
                        _pageController.jumpToPage(3);
                      },
                    ),
                  ],
                ),
              ),
              PageView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      pageNo = page;
                    });
                  },
                  children: const <Widget>[
                    UserPersonalDetailEditPage(),
                    SkillDetailPage(),
                    ExperienceDetailPage(),
                    EducationCertificationDetailPage(),
                  ]),
            ],
          ),
        ),
      );
    });
  }
}

class StepperComponent extends StatelessWidget {
  final int index;
  final String text;
  final int currentIndex;
  final VoidCallback onTap;
  final bool isLast;
  const StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    required this.text,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: appStyle(
                    10,
                    index == currentIndex
                        ? Color(kPink.value)
                        : Color(kDarkBlue.value),
                    FontWeight.normal),
              ),
              const HeightSpacer(size: 5),
              Row(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: index == currentIndex
                            ? Color(kPink.value)
                            : Colors.transparent,
                        border: Border.all(
                            color: currentIndex >= index
                                ? Color(kPink.value)
                                : Colors.black12),
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: currentIndex >= index + 1
                        ? Color(kPink.value)
                        : Colors.black12,
                  ),
                ],
              ),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: appStyle(
                      10,
                      index == currentIndex
                          ? Color(kPink.value)
                          : Color(kDarkBlue.value),
                      FontWeight.normal),
                ),
                const HeightSpacer(size: 5),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: index == currentIndex
                              ? Color(kPink.value)
                              : Colors.transparent,
                          border: Border.all(
                              color: currentIndex >= index
                                  ? Color(kPink.value)
                                  : Colors.black12),
                        ),
                      ),
                    ),
                    //this the ligne
                    Expanded(
                        child: Container(
                      height: 2,
                      color: currentIndex >= index + 1
                          ? Color(kPink.value)
                          : Colors.black12,
                    )),
                  ],
                ),
              ],
            ),
          );
  }
}

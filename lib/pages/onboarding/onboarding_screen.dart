import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/controllers/exports.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/reusable_text.dart';
import 'package:job_studio/pages/onboarding/widget/third_pages.dart';
import 'package:job_studio/pages/onboarding/widget/one_page.dart';
import 'package:job_studio/pages/onboarding/widget/second_page.dart';
import 'package:job_studio/pages/onboarding/widget/forth_page.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<OnBoardingNotifer>(
      builder: (context, onBoardingNotifer, child) {
        return Stack(
          children: [
            PageView(
              physics: onBoardingNotifer.isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (page) {
                onBoardingNotifer.isLastPage = page == 3;
              },
              children: const [
                FirstPage(),
                SecondPage(),
                ThirdPage(),
                ForthPage(),
              ],
            ),
            Positioned(
              bottom: height * 0.15,
              left: 0,
              right: 0,
              child: Center(
                child: onBoardingNotifer.isLastPage
                    ? const SizedBox.shrink()
                    : SmoothPageIndicator(
                        controller: pageController,
                        count: 4,
                        effect: WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 10,
                          dotColor: Color(kDarkGrey.value),
                        ),
                      ),
              ),
            ),
            Positioned(
                child: onBoardingNotifer.isLastPage
                    ? const SizedBox.shrink()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 30.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(3);
                                },
                                child: ReusableText(
                                    text: "Skip",
                                    style: appStyle(16, Color(kDark.value),
                                        FontWeight.w500)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                },
                                child: ReusableText(
                                    text: "Next",
                                    style: appStyle(16, Color(kDark.value),
                                        FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                      ))
          ],
        );
      },
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/app_style.dart';
import '../../../../common/height_spacer.dart';
import '../../../../common/reusable_text.dart';
import '../../../../constansts/app_constants.dart';

class UserPersonalDetailEditPage extends StatefulWidget {
  const UserPersonalDetailEditPage({super.key});

  @override
  State<UserPersonalDetailEditPage> createState() =>
      _UserPersonalDetailEditPageState();
}

class _UserPersonalDetailEditPageState
    extends State<UserPersonalDetailEditPage> {
  TextEditingController controller = TextEditingController();
  List<GenderDetail> genderList = [
    GenderDetail(img: "assets/girl.svg", text: "Female"),
    GenderDetail(img: "assets/boy.svg", text: "Mate"),
    GenderDetail(img: "assets/star.svg", text: "Other"),
  ];
  List<String> language = [
    "Hindi",
    "Englisg",
    "Telugu",
    "Tamil",
    "Marathi",
    "French",
  ];
  List<String> typeList = [
    "College Student",
    "Fresher",
    "Working Professional",
    "School Student",
    "Woman returning to work",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldForForm(
            text: "Full Name",
            controller: controller,
            hideText: "Full Name",
          ),
          TextFieldForForm(
            text: "Email",
            controller: controller,
            hideText: "Email",
          ),
          TextFieldForForm(
            text: "Mobile Number",
            controller: controller,
            hideText: "Mobile Number",
          ),
          TextFieldForForm(
            text: "Current City",
            controller: controller,
            hideText: "Current Location",
          ),
          ReusableText(
            text: "Genter",
            style: appStyle(14, Color(kDarkBlue.value), FontWeight.bold),
          ),
          SizedBox(
            height: 45,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: genderList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(kLightGrey.value)),
                      color: Color(kLight.value),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // pageController.jumpToPage(index);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              genderList[index].img,
                              width: 25,
                              height: 25,
                            ),
                            Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                genderList[index].text,
                                style: appStyle(14, Color(kMidGrey.value),
                                    FontWeight.normal),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const HeightSpacer(size: 15),
          ReusableText(
            text: "Languages",
            style: appStyle(14, Color(kDarkBlue.value), FontWeight.bold),
          ),
          SizedBox(
            height: 45,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: language.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(kLightGrey.value)),
                      color: Color(kLight.value),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // pageController.jumpToPage(index);
                        },
                        child: Expanded(
                            child: Row(
                          children: [
                            Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                language[index],
                                style: appStyle(14, Color(kMidGrey.value),
                                    FontWeight.normal),
                              ),
                            )),
                            Icon(
                              Icons.add,
                              size: 25,
                              color: Color(kMidGrey.value),
                            )
                          ],
                        )),
                      ),
                    ),
                  );
                }),
          ),
          const HeightSpacer(size: 15),
          ReusableText(
            text: "Type",
            style: appStyle(14, Color(kDarkBlue.value), FontWeight.bold),
          ),
          SizedBox(
            height: 45,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: typeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(kLightGrey.value)),
                      color: Color(kLight.value),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // pageController.jumpToPage(index);
                        },
                        child: Expanded(
                            child: Row(
                          children: [
                            Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                typeList[index],
                                style: appStyle(14, Color(kMidGrey.value),
                                    FontWeight.normal),
                              ),
                            )),
                          ],
                        )),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class TextFieldForForm extends StatelessWidget {
  const TextFieldForForm(
      {super.key, required this.text, this.controller, required this.hideText});
  final String text;
  final String hideText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 2),
          child: ReusableText(
            text: text,
            style: appStyle(14, Color(kDarkBlue.value), FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 50,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hideText,
              hintStyle: appStyle(14, Color(kMidGrey.value), FontWeight.normal),
              // border: InputBorder.none,
              // border: OutlineInputBorder(
              //     borderSide: BorderSide(color: Color(kPink.value))),
              filled: true,
              fillColor: Color(kLight.value),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color(kLightGrey.value),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color(kLightGrey.value),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        const HeightSpacer(size: 15),
      ],
    );
  }
}

class GenderDetail {
  final String text;
  final String img;
  GenderDetail({required this.img, required this.text});
}

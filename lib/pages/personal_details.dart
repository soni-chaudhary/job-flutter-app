import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/reusable_text.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/controllers/exports.dart';
import 'package:provider/provider.dart';

import '../common/buttons/custom_button.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController mobileCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CustomButton(
                backgroundColor: Color(kPink.value),
                height: 50,
                text: "Save",
                width: MediaQuery.of(context).size.width,
                textColor: Color(kLight.value),
                radius: 5),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "Personal Details",
                        style:
                            appStyle(18, Color(kDark.value), FontWeight.w500),
                      ),
                      Consumer<ImageUpdateProvider>(
                          builder: (context, imageNotifer, child) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 1, color: Color(kLightGrey.value)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: imageNotifer.imageUrlName.isEmpty
                                      ? const CircleAvatar(
                                          radius: 20,
                                          backgroundImage:
                                              AssetImage("images/person.png"),
                                        )
                                      : CircleAvatar(
                                          radius: 20,
                                          backgroundImage: FileImage(File(
                                              imageNotifer.imageUrlName[0])),
                                        ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: GestureDetector(
                                  onTap: () {
                                    imageNotifer.pickImage();
                                  },
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor:
                                        Color(kLightbackground.value),
                                    // backgroundImage: AssetImage("images/man.jpg"),
                                    child: Icon(
                                      Icons.edit,
                                      size: 18,
                                      color: Color(klightBlue.value),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                  const HeightSpacer(size: 30),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFieldForForm(
                          text: "Full Name",
                          controller: mobileCon,
                          hideText: "Full Name",
                        ),
                        TextFieldForForm(
                          text: "Email",
                          controller: mobileCon,
                          hideText: "Email",
                        ),
                        TextFieldForForm(
                          text: "Mobile Number",
                          controller: mobileCon,
                          hideText: "Mobile Number",
                        ),
                        TextFieldForForm(
                          text: "Current City",
                          controller: mobileCon,
                          hideText: "Current Location",
                        ),
                        TextFieldForForm(
                          text: "Genger",
                          controller: mobileCon,
                          hideText: "Genter",
                        ),
                        TextFieldForForm(
                          text: "Languages",
                          controller: mobileCon,
                          hideText: "Languages",
                        ),
                        TextFieldForForm(
                          text: "Type",
                          controller: mobileCon,
                          hideText: "Type",
                        ),
                      ],
                    ),
                  )
                  // ReusableText(
                  //   text: "Personal Details",
                  //   style: appStyle(18, Color(kDark.value), FontWeight.w500),
                  // ),
                ],
              ),
            ),
          ),
        ));
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
          height: 45,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hideText,
              hintStyle: appStyle(14, Color(kMidGrey.value), FontWeight.normal),
              border: InputBorder.none,
              filled: true,
              fillColor: Color(kLightbackground.value),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color(kLight.value),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color(kLight.value),
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

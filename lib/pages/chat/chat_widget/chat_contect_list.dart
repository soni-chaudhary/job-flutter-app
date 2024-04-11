import 'package:flutter/material.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/common/app_style.dart';
import '../../../common/height_spacer.dart';

class ChatContactList extends StatelessWidget {
  const ChatContactList({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("images/man.jpg"),
              ),
              Positioned(
                top: 30,
                left: 30,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(kLight.value),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Color(kDarkGreen.value),
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Text("company name",
              style: appStyle(12, Color(kDark.value), FontWeight.bold)),
          subtitle: Text("latest msg....",
              style: appStyle(8, Color(kDark.value), FontWeight.normal)),
          trailing: Column(
            children: [
              Text("08:34",
                  style: appStyle(10, Color(kDark.value), FontWeight.bold)),
              const HeightSpacer(size: 5),
              Column(
                children: [
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: Color(kPink.value),
                    child: Text(
                      "3",
                      style: appStyle(7, Color(kLight.value), FontWeight.normal),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/constansts/app_constants.dart';
import '../../common/width_spacer.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
                height: 42.h,
                decoration: BoxDecoration(
                    color: Color(kLightbackground.value),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Color(kMidGrey.value),
                      ),
                      const WidthSpacer(size: 5),
                      Text(
                        text,
                        style: appStyle(
                            15, Color(kMidGrey.value), FontWeight.normal),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        const WidthSpacer(size: 10),
        Expanded(
          flex: 1,
          child: Container(
            height: 42.h,
            decoration: BoxDecoration(
                color: Color(kPink.value),
                borderRadius: BorderRadius.circular(10)),
            child: Icon(FontAwesomeIcons.sliders, color: Color(kLight.value)),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import '../../../../common/app_style.dart';
import '../../../../constansts/app_constants.dart';

class SkillDetailWidget extends StatefulWidget {
  const SkillDetailWidget({super.key});

  @override
  State<SkillDetailWidget> createState() => _SkillDetailWidgetState();
}

class _SkillDetailWidgetState extends State<SkillDetailWidget> {
  List<String> skill = ["Java", "HTML", "CSS", "JavaScript", "Flutter", "Node"];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      // direction: Axis.vertical,

      children: List.generate(
        skill.length,
        (index) => Container(
          margin: const EdgeInsets.only(left: 5, bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Color(kLightGrey.value)),
            color: Color(kLight.value),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
            child: GestureDetector(
              onTap: () {
                // pageController.jumpToPage(index);
              },
              child: Text(
                skill[index],
                style: appStyle(14, Color(kMidGrey.value), FontWeight.normal),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

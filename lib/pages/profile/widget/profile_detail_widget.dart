import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/pages/profile/widget/user_detail/contact_info.dart';

class ContactInfoWidget extends StatefulWidget {
  const ContactInfoWidget(
      {super.key, required this.icon, required this.text, this.widgets});
  final String icon;
  final String text;
  final Widget? widgets;

  @override
  State<ContactInfoWidget> createState() => _ContactInfoWidgetState();
}

class _ContactInfoWidgetState extends State<ContactInfoWidget> {
  bool _expanded = false;
  bool isBiometricEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Color(kLight.value),
          border: Border.all(color: Color(kLightGrey.value)),
          borderRadius: BorderRadius.circular(5)),
      child: ExpansionTile(
          expandedAlignment: Alignment.centerLeft,
          textColor: Color(kDarkBlue.value),
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          leading: SvgPicture.asset(
            widget.icon,
            width: 20,
            height: 20,
            color: Color(kDarkBlue.value),
          ),
          title: Text(widget.text),
          onExpansionChanged: (value) {
            setState(() {
              _expanded = !_expanded;
            });
          },
          trailing: _expanded
              ? Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(kDarkBlue.value),
                )
              : Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(kDarkBlue.value),
                ),
          children: [widget.widgets ?? const ContactDetailWidget()]),
    );
  }
}

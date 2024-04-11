import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? align;
  const ReusableText(
      {super.key, required this.text, required this.style, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: false,
      textAlign: align,
      overflow: TextOverflow.fade,
      style: style,
    );
  }
}

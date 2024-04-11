import 'package:flutter/material.dart';

class SearchWidgetText extends StatelessWidget {
  const SearchWidgetText({super.key, required this.text, this.controller, required this.backgroundColor});
  final String text;
  final TextEditingController? controller;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }
}

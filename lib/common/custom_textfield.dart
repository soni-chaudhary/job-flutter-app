import 'package:flutter/material.dart';
import 'package:job_studio/constansts/app_constants.dart';

// class CustomTextFieldUnderline extends StatelessWidget {
//   const CustomTextFieldUnderline({
//     super.key,
//     this.keyboardType,
//     this.obscureText,
//     required this.hintText,
//     this.suffixIcon,
//     required this.controller,
//     this.validator,
//     this.isError,
//     this.isLoading,
//     this.prefixIcon,
//     this.minLines,
//     this.maxLines,
//   });
//   final TextInputType? keyboardType;
//   final bool? obscureText;
//   final String hintText;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final bool? isError;
//   final bool? isLoading;
//   final int? minLines;
//   final int? maxLines;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ReusableText(
//           text: hintText,
//           style: appStyle(14, Color(kMidGreen.value), FontWeight.w500),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 5),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.grey.shade100,
//           ),
//           padding: const EdgeInsets.only(left: 10),
//           child: TextFormField(
//             // maxLength: 20,
//             minLines: minLines,
//             maxLines: maxLines,
//             keyboardType: keyboardType,
//             obscureText: obscureText ?? false,
//             decoration: InputDecoration(
//               hintText: hintText,
//               suffixIcon: suffixIcon,
//               prefixIcon: prefixIcon,
//               hintStyle: appStyle(12, const Color.fromARGB(255, 216, 216, 216),
//                   FontWeight.w500),
//               // border: const UnderlineInputBorder(),
//               border: InputBorder.none,
//               // border: const OutlineInputBorder(),
//             ),
//             controller: controller,
//             cursorHeight: 20,
//             style: appStyle(14, Color(kDark.value), FontWeight.w500),
//             validator: validator,
//           ),
//         ),
//         const HeightSpacer(size: 15),
//       ],
//     );
//   }
// }

class CustomTextFieldUnderline extends StatelessWidget {
  const CustomTextFieldUnderline({
    Key? key,
    this.star,
    this.controller,
    this.enabled = true,
    // required this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.readOnly = false,
    this.autofocus = false,
    required this.isError,
    required this.hintText,
    this.validator,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
    this.obscureText,
  }) : super(key: key);
  final String? star;
  final TextEditingController? controller;
  final bool enabled;
  // final Function(String) onChanged;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool autofocus;
  final bool isError;
  final String hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        obscureText: obscureText ?? false,
        maxLines: maxLines,
        minLines: minLines,
        autofocus: autofocus,
        style: const TextStyle(fontSize: 14),
        keyboardType: keyboardType,
        controller: controller,
        enabled: enabled,
        readOnly: readOnly,
        textCapitalization: textCapitalization,
        onChanged: (value) {
          // widget.onChanged(value);
        },
        decoration: InputDecoration(
          alignLabelWithHint: true,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              width: 1,
              color: Color(klightBlue.value),
            ),
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: const TextStyle(fontWeight: FontWeight.w100),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade300,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade300,
            ),
          ),
          label: RichText(
            text: TextSpan(
                style: const TextStyle(color: Colors.grey, fontSize: 15),
                children: [
                  TextSpan(text: hintText),
                  TextSpan(
                      text: star,
                      style: const TextStyle(color: Colors.red, fontSize: 15)),
                ]),
          ),
          labelStyle: const TextStyle(
            color: Colors.grey, //<-- SEE HERE
          ),
        ),
      ),
    );
  }
}

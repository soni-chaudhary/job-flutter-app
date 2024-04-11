import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app_style.dart';
import '../../common/buttons/custom_button.dart';
import '../../common/custom_textfield.dart';
import '../../common/height_spacer.dart';
import '../../common/reusable_text.dart';
import '../../constansts/app_constants.dart';
import '../../controllers/auth/otp_provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  bool isEmailError = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<OtpProviderNotifer>(builder: (context, otpNotifer, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const HeightSpacer(size: 100),
                ReusableText(
                    text: "Forgot Password",
                    style: appStyle(30, Color(kDark.value), FontWeight.w600)),
                const HeightSpacer(size: 10),
                ReusableText(
                  text:
                      "Please enter your email below and we will\n send you the OTP code",
                  align: TextAlign.center,
                  style: appStyle(14, Color(kMidGrey.value), FontWeight.normal),
                ),
                const HeightSpacer(size: 50),
                CustomTextFieldUnderline(
                  isError: isEmailError,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  validator: (emailController) {
                    if (emailController!.isEmpty ||
                        !emailController.contains("@")) {
                      isEmailError = true;
                      return "invalid email";
                    } else {
                      return null;
                    }
                  },
                ),
                const HeightSpacer(size: 20),
                CustomButton(
                  onTap: () {
                    otpNotifer.isLoading = true;
                    otpNotifer.resendOtp(email: emailController.text,isForgotPasswordScreen: true);
                  },
                  isLoading: otpNotifer.isLoading,
                  height: height * 0.06,
                  text: "Send",
                  width: width,
                  textColor: Color(kLight.value),
                  radius: 6,
                  backgroundColor: Color(kPink.value),
                ),
                const HeightSpacer(size: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReusableText(
                      text: "Don't received the code ",
                      align: TextAlign.center,
                      style: appStyle(
                          10, Color(kMidGrey.value), FontWeight.normal),
                    ),
                    ReusableText(
                      text: "Resend code?",
                      align: TextAlign.center,
                      style:
                          appStyle(10, Color(kPink.value), FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

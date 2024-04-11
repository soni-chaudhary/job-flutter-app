import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app_style.dart';
import '../../common/buttons/custom_button.dart';
import '../../common/custom_textfield.dart';
import '../../common/height_spacer.dart';
import '../../common/reusable_text.dart';
import '../../constansts/app_constants.dart';
import '../../controllers/auth/forgot_provider.dart';

class CreateNewPasswordPage extends StatefulWidget {
  final String email;
  const CreateNewPasswordPage({super.key, required this.email});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  bool isEmailError = false;
  bool otpError = false;
  bool passwordError1 = false;
  bool passwordError2 = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordProvider>(
        builder: (context, forgotNotifer, child) {
      return Scaffold(
        body: Padding(
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
                isError: otpError,
                controller: otpController,
                keyboardType: TextInputType.emailAddress,
                hintText: "Otp Code",
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
              CustomTextFieldUnderline(
                maxLines: 1,
                isError: passwordError1,
                controller: passwordController1,
                hintText: "Password",
                validator: (passwordController) {
                  if (passwordController!.isEmpty ||
                      passwordController.length > 7) {
                    passwordError1 = true;
                    return "Please enter the valid password";
                  } else {
                    return null;
                  }
                },
                obscureText: forgotNotifer.obscureText1,
                suffixIcon: GestureDetector(
                    onTap: () {
                      forgotNotifer.obscureText1 =
                          !(forgotNotifer.obscureText1);
                    },
                    child: forgotNotifer.obscureText1
                        ? Icon(
                            Icons.visibility,
                            color: Color(kMidGrey.value),
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Color(kMidGrey.value),
                          )),
              ),
              CustomTextFieldUnderline(
                maxLines: 1,
                controller: passwordController2,
                hintText: "Confirm Password",
                validator: (password) {
                  if (password!.isEmpty || password.length > 8) {
                    passwordError1 = true;
                    return ("Please enter valid password with at list contain upper,lower,digit and Special character ");
                  }
                  return null;
                },
                obscureText: forgotNotifer.obscureText2,
                suffixIcon: GestureDetector(
                  onTap: () {
                    forgotNotifer.obscureText2 = !(forgotNotifer.obscureText2);
                  },
                  child: forgotNotifer.obscureText2
                      ? Icon(
                          Icons.visibility,
                          color: Color(kMidGrey.value),
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Color(kMidGrey.value),
                        ),
                ),
                isError: passwordError1,
              ),
              const HeightSpacer(size: 20),
              CustomButton(
                onTap: () {
                  forgotNotifer.isLoading = true;
                  forgotNotifer.forgotPasswordHelper(
                      email: widget.email,
                      password: passwordController1.text,
                      otp: otpController.text);
                },
                isLoading: forgotNotifer.isLoading,
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
                    style:
                        appStyle(10, Color(kMidGrey.value), FontWeight.normal),
                  ),
                  ReusableText(
                    text: "Resend code?",
                    align: TextAlign.center,
                    style: appStyle(10, Color(kPink.value), FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

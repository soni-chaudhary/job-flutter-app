import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/common/custom_textfield.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/controllers/exports.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/app_bar.dart';
import 'package:job_studio/common/buttons/custom_button.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/reusable_text.dart';
import 'package:job_studio/models/auth/login_model.dart';
import 'package:job_studio/pages/auth/forgot_page.dart';
import 'package:job_studio/pages/onboarding/widget/forth_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isEmailError = false;
  bool isPasswordError = false;
  bool isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginNotifer, child) {
      loginNotifer.getPrefs;
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            color: Color(kLight.value),
            text: "Login",
            child: loginNotifer.loggedIn
                ? GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(CupertinoIcons.arrow_left),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            key: loginNotifer.loginFormKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeightSpacer(size: 50),
                ReusableText(
                    text: "Welcome Back!",
                    style: appStyle(30, Color(kDark.value), FontWeight.w600)),
                const HeightSpacer(size: 8),
                ReusableText(
                  text:
                      "Welcome to Job Studio, please enter your \nlogin details below to using the ",
                  align: TextAlign.center,
                  style:
                      appStyle(14, Color(kDarkBlue.value), FontWeight.normal),
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
                CustomTextFieldUnderline(
                  maxLines: 1,
                  isError: isPasswordError,
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Password",
                  validator: (passwordController) {
                    if (passwordController!.isEmpty ||
                        passwordController.length < 5) {
                      isPasswordError = true;
                      return "Please enter the valid password";
                    } else {
                      return null;
                    }
                  },
                  obscureText: loginNotifer.obscureText,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        loginNotifer.obscureText = !(loginNotifer.obscureText);
                      },
                      child: loginNotifer.obscureText
                          ? Icon(
                              Icons.visibility,
                              color: Color(kMidGrey.value),
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Color(kMidGrey.value),
                            )),
                ),
                const HeightSpacer(size: 5),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgotPasswordPage());
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      child: ReusableText(
                        text: "Forgot the password?",
                        style: appStyle(
                            12, Color(kDarkBlue.value), FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                const HeightSpacer(size: 30),
                CustomButton(
                  onTap: () {
                    loginNotifer.isLoading = true;
                    if (loginNotifer.validateAndSave()) {
                      LoginModel model = LoginModel(
                          password: passwordController.text,
                          email: emailController.text);
                      loginNotifer.userLogin(model);
                    } else {
                      Get.snackbar(
                          "Login Failed", "Please check your credentials",
                          colorText: Color(kLight.value),
                          backgroundColor: Colors.red,
                          icon: const Icon(Icons.add_alert));
                      loginNotifer.isLoading = false;
                    }
                  },
                  isLoading: loginNotifer.isLoading,
                  height: height * 0.06,
                  text: "Login",
                  width: width,
                  textColor: Color(kLight.value),
                  radius: 6,
                  backgroundColor: Color(kPink.value),
                ),
                const HeightSpacer(size: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const ForthPage());
                    },
                    child: Row(
                      children: [
                        ReusableText(
                          text: "Not have Account",
                          style: appStyle(
                              12, Color(kDarkBlue.value), FontWeight.w400),
                        ),
                        ReusableText(
                          text: " Sign Up?",
                          style:
                              appStyle(12, Color(kPink.value), FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const HeightSpacer(size: 10),
              ],
            ),
          ),
        ),
      );
    });
  }
}

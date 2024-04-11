import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/width_spacer.dart';
import 'package:job_studio/pages/auth/login-page.dart';
import 'package:provider/provider.dart';
import '../../common/custom_textfield.dart';
import '../../constansts/app_constants.dart';
import '../../controllers/auth/register-provider.dart';
import '../../common/app_bar.dart';
import '../../common/app_style.dart';
import '../../common/buttons/custom_button.dart';
import '../../common/reusable_text.dart';
import '../../models/auth/register-model.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = "/userRegister";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  bool isEmailError = false;
  bool isPasswordError = false;
  bool isUserNameError = false;
  bool isFirstNameError = false;
  bool isLastNameError = false;
  bool isPhoneNoError = false;
  bool isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    userNameController.dispose();
    lastNameController.dispose();
    phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterNotifer>(
        builder: (context, registerNotifer, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            color: Color(kLight.value),
            text: "Register",
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(CupertinoIcons.arrow_left),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Form(
              key: registerNotifer.registerFormKey,
              child: Column(
                children: [
                  const HeightSpacer(size: 50),
                  ReusableText(
                      text: "Hellow Welcome!",
                      style: appStyle(30, Color(kDark.value), FontWeight.w600)),
                  ReusableText(
                    text: "Fill the details to signup for an account",
                    style: appStyle(14, Color(kDarkBlue.value), FontWeight.w400),
                  ),
                  const HeightSpacer(size: 40),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFieldUnderline(
                          controller: firstNameController,
                          isError: isFirstNameError,
                          hintText: "First Name",
                          validator: (name) {
                            if (name!.isEmpty) {
                              isFirstNameError = true;
                              return "Please enter valid Name";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const WidthSpacer(size: 5),
                      Expanded(
                        child: CustomTextFieldUnderline(
                          controller: lastNameController,
                          isError: isLastNameError,
                          hintText: "Last Name",
                          validator: (name) {
                            if (name!.isEmpty) {
                              isLastNameError = true;
                              return "Please enter valid Name";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomTextFieldUnderline(
                    controller: userNameController,
                    hintText: "User Name",
                    isError: isUserNameError,
                    validator: (userNameController) {
                      if (userNameController!.isEmpty) {
                        isUserNameError = true;
                        return "Please enter valid User Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomTextFieldUnderline(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    isError: isEmailError,
                    validator: (emailController) {
                      if (emailController!.isEmpty ||
                          !emailController.contains("@")) {
                        isEmailError = true;
                        return "Please enter invalid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomTextFieldUnderline(
                    controller: phoneNoController,
                    keyboardType: TextInputType.number,
                    hintText: "Phone Number",
                    isError: isPhoneNoError,
                    validator: (phoneNo) {
                      if (phoneNo!.isEmpty && phoneNo.length == 10) {
                        isPhoneNoError = true;
                        return "Please enter invalid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomTextFieldUnderline(
                    maxLines: 1,
                    controller: passwordController,
                    hintText: "Password",
                    validator: (password) {
                      if (registerNotifer.passwordValidator(password ?? "")) {
                        isPasswordError = true;
                        return ("Please enter valid password with at list contain upper,lower,digit and Special character ");
                      }
                      return null;
                    },
                    obscureText: registerNotifer.obscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        registerNotifer.obscureText =
                            !(registerNotifer.obscureText);
                      },
                      child: registerNotifer.obscureText
                          ? Icon(
                              Icons.visibility,
                              color: Color(kMidGrey.value),
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Color(kMidGrey.value),
                            ),
                    ),
                    isError: isPasswordError,
                  ),
                  const HeightSpacer(size: 10),
                  CustomButton(
                    onTap: () {
                      // loginNotifier.firstTime = !loginNotifier.firstTime;
                      registerNotifer.isLoading = true;
                      if (registerNotifer.validateAndSave()) {
                        RegisterModel model = RegisterModel(
                          password: passwordController.text,
                          email: emailController.text,
                          phoneNo: phoneNoController.text,
                          username: userNameController.text,
                          lastName: lastNameController.text,
                          firstName: firstNameController.text,
                        );
                        registerNotifer.userRegister(model);
                      } else {
                        Get.snackbar(
                            "Register Failed", "Please check your credentials",
                            colorText: Color(kLight.value),
                            backgroundColor: Colors.red,
                            icon: const Icon(Icons.add_alert));
                        registerNotifer.isLoading = false;
                      }
                    },
                    isLoading: registerNotifer.isLoading,
                    height: height * 0.06,
                    text: "Register",
                    width: width,
                    textColor: Color(kLight.value),
                    radius: 10,
                    backgroundColor: Color(kPink.value),
                  ),
                  const HeightSpacer(size: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          ReusableText(
                            text: "Have already account?",
                            style: appStyle(
                                12, Color(kDarkBlue.value), FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(LoginPage.routeName);
                            },
                            child: ReusableText(
                              text: " Sign In?",
                              style: appStyle(
                                  12, Color(kPink.value), FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

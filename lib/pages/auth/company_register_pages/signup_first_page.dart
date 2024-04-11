import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/common/width_spacer.dart';
import 'package:provider/provider.dart';
import '../../../common/app_bar.dart';
import '../../../common/app_style.dart';
import '../../../common/buttons/custom_button.dart';
import '../../../common/custom_textfield.dart';
import '../../../common/reusable_text.dart';
import '../../../constansts/app_constants.dart';
import '../../../controllers/auth/company_register_provider.dart';

class SignUpByCompanyFirstPage extends StatefulWidget {
  static const routeName = "/companyRegisterRout";
  const SignUpByCompanyFirstPage({super.key});

  @override
  State<SignUpByCompanyFirstPage> createState() =>
      _SignUpByCompanyFirstPageState();
}

class _SignUpByCompanyFirstPageState extends State<SignUpByCompanyFirstPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companySizeController = TextEditingController();
  TextEditingController companyPhoneController = TextEditingController();
  TextEditingController companyCodeController = TextEditingController();
  TextEditingController establishedYearController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController companyDesController = TextEditingController();
  bool isEmailError = false;
  bool isPasswordError = false;
  bool isNameError = false;
  bool isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    companyNameController.dispose();
    companySizeController.dispose();
    companyPhoneController.dispose();
    passwordController.dispose();
    establishedYearController.dispose();
    companyDesController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    companyDesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CompanyRegisterNotifer>(
        builder: (context, loginNotifer, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            text: "Register",
            color: Color(kLight.value),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(CupertinoIcons.arrow_left),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
              ),
            ],
          ),
          height: 80,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: CustomButton(
                onTap: () {
                  // loginNotifier.firstTime = !loginNotifier.firstTime;
                  // registerNotifer.isLoading = true;
                  // if (registerNotifer.validateAndSave()) {
                  //   RegisterModel model = RegisterModel(
                  //     password: passwordController.text,
                  //     email: emailController.text,
                  //     name: nameController.text,
                  //   );
                  //   registerNotifer.userRegister(model);
                  // } else {
                  //   Get.snackbar(
                  //       "Register Failed", "Please check your credentials",
                  //       colorText: Color(kLight.value),
                  //       backgroundColor: Colors.red,
                  //       icon: const Icon(Icons.add_alert));
                  //   registerNotifer.isLoading = false;
                  // }
                },
                // isLoading: registerNotifer.isLoading,
                height: height * 0.06,
                text: "Submit",
                width: width,
                textColor: Color(kLight.value),
                radius: 5,
                backgroundColor: Color(kPink.value),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Form(
              // key: registerNotifer.registerFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeightSpacer(size: 20),
                    ReusableText(
                        text: "Hellow Welcome!",
                        style:
                            appStyle(30, Color(kDark.value), FontWeight.w600)),
                    ReusableText(
                      text: "Fill the details to signup for an account",
                      style:
                          appStyle(14, Color(kDarkBlue.value), FontWeight.w400),
                    ),
                    const HeightSpacer(size: 20),
                    CustomTextFieldUnderline(
                      controller: companyNameController,
                      isError: isNameError,
                      hintText: "Company Name",
                      validator: (name) {
                        if (name!.isEmpty) {
                          isNameError = true;
                          return "Please enter valid Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextFieldUnderline(
                      controller: companySizeController,
                      isError: isNameError,
                      hintText: "Company Size",
                      validator: (name) {
                        if (name!.isEmpty) {
                          isNameError = true;
                          return "Please enter valid Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextFieldUnderline(
                      controller: companyPhoneController,
                      isError: isNameError,
                      hintText: "Company PhoneNo",
                      validator: (name) {
                        if (name!.isEmpty) {
                          isNameError = true;
                          return "Please enter valid Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextFieldUnderline(
                      controller: companyCodeController,
                      isError: isNameError,
                      hintText: "Country Code",
                      validator: (name) {
                        if (name!.isEmpty) {
                          isNameError = true;
                          return "Please enter valid Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextFieldUnderline(
                      controller: locationController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Location",
                      isError: isEmailError,
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
                      controller: establishedYearController,
                      isError: isNameError,
                      hintText: "Established Year",
                      validator: (name) {
                        if (name!.isEmpty) {
                          isNameError = true;
                          return "Please enter valid Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextFieldUnderline(
                            controller: address1Controller,
                            isError: isNameError,
                            hintText: "Address1",
                            validator: (name) {
                              if (name!.isEmpty) {
                                isNameError = true;
                                return "Please enter valid Name";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const WidthSpacer(size: 10),
                        Expanded(
                          child: CustomTextFieldUnderline(
                            controller: address2Controller,
                            isError: isNameError,
                            hintText: "Address2",
                            validator: (name) {
                              if (name!.isEmpty) {
                                isNameError = true;
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Email",
                      isError: isEmailError,
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
                      controller: passwordController,
                      hintText: "Password",
                      validator: (password) {
                        // if (registerNotifer.passwordValidator(password ?? "")) {
                        //   isPasswordError = true;
                        //   return ("Please enter valid password with at list contain upper,lower,digit and Special character ");
                        // }
                        // return null;
                      },
                      // obscureText: registerNotifer.obscureText,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            // registerNotifer.obscureText =
                            //     !(registerNotifer.obscureText);
                          },
                          child:
                              // registerNotifer.obscureText
                              // ?
                              Icon(
                            Icons.visibility,
                            color: Color(kMidGrey.value),
                          )
                          // :
                          // Icon(
                          //     Icons.visibility_off,
                          //     color: Color(kDarkGrey.value),
                          //   ),
                          ),
                      isError: false,
                    ),
                    CustomTextFieldUnderline(
                      minLines: 7,
                      // maxLines: ,
                      controller: companyDesController,
                      hintText: "Description",
                      validator: (password) {
                        // if (registerNotifer.passwordValidator(password ?? "")) {
                        //   isPasswordError = true;
                        //   return ("Please enter valid password with at list contain upper,lower,digit and Special character ");
                        // }
                        // return null;
                      },
                      isError: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

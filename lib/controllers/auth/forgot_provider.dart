import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/pages/auth/login-page.dart';

import '../../constansts/app_constants.dart';
import '../../repository/otp_repo.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool newState) {
    _isLoading = newState;
    notifyListeners();
  }

  bool _obscureText1 = true;
  bool get obscureText1 => _obscureText1;
  set obscureText1(bool isObscureText) {
    _obscureText1 = isObscureText;
    notifyListeners();
  }

  bool _obscureText2 = true;
  bool get obscureText2 => _obscureText2;
  set obscureText2(bool isObscure) {
    _obscureText2 = isObscure;
    notifyListeners();
  }

  forgotPasswordHelper({
    required String email,
    required String password,
    required String otp,
  }) {
    VarifyOtpRepo.forgotPasswordRepo(email: email, password: password, otp: otp)
        .then((response) {
      if (response) {
        isLoading = false;
        Fluttertoast.showToast(
            msg: "Change Password Successfully ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Get.toNamed(LoginPage.routeName);
      } else {
        Get.snackbar("OTP Verification Failed", "Please Enter vaild OTP",
            colorText: Color(kLight.value),
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.add_alert,
              color: Color(kLight.value),
            ));
        isLoading = false;
      }
    });
  }
}

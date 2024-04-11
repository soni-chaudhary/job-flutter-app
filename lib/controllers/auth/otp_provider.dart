import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/pages/auth/login-page.dart';
import 'package:job_studio/repository/otp_repo.dart';

import '../../models/auth/otp_model.dart';
import '../../pages/auth/get_rename_password.dart';

class OtpProviderNotifer with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool newState) {
    _isLoading = newState;
    notifyListeners();
  }

  bool _resendOtp = false;
  bool get isResendOtp => _resendOtp;
  set isResendOtp(bool newState) {
    _resendOtp = newState;
    notifyListeners();
  }

  Timer? _timer;
  int _seconds = 30;
  bool get isRunning => _timer != null;
  int get seconds => _seconds;

  void startTimer() {
    if (_timer == null) {
      const oneSec = Duration(seconds: 1);
      _timer = Timer.periodic(oneSec, (timer) {
        _seconds--;
        if (_seconds == 0) {
          isResendOtp = true;
          stopTimer();
        }
        notifyListeners();
      });
    }
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void restartTimer() {
    startTimer(); // Restart the timer
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  int _startingTimer = 30;
  int get currentOtpRemainingTime => _startingTimer;
  set currentOtpRemainingTime(int newIndex) {
    _startingTimer = newIndex;
    notifyListeners();
  }

  otpVarify(OtpModel model) {
    VarifyOtpRepo.otpVerifyRepo(model).then((response) {
      if (response) {
        isLoading = false;
        Fluttertoast.showToast(
            msg: "Successfully OTP Verification",
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

  resendOtp({required String email,bool? isForgotPasswordScreen}) {
    _seconds = 30;
    restartTimer();
    VarifyOtpRepo.resendOtpRepo(email).then((response) {
      if (response) {
        if(isForgotPasswordScreen??false){
          isLoading=false;
          Fluttertoast.showToast(
            msg: "Otp send on your email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
          Get.to(() => CreateNewPasswordPage(
                email: email,
              ));
        }else{
          Get.snackbar(
            "Resend OTP Sended", "Resend otp please check on your email",
            colorText: Color(kLight.value),
            backgroundColor: Color(kDarkBlue.value),
            icon: Icon(
              Icons.add_alert,
              color: Color(kLight.value),
            ));
        }
      } else {
        if (isForgotPasswordScreen ?? false) {
          isLoading=false;
           Get.snackbar("Send OTP Failed", "Please try again",
            colorText: Color(kLight.value),
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.add_alert,
              color: Color(kLight.value),
            ));
         
        }else{
          Get.snackbar("Resend OTP Failed", "Please try again",
            colorText: Color(kLight.value),
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.add_alert,
              color: Color(kLight.value),
            ));
        _seconds = 0;
        notifyListeners();
        stopTimer();
        }

        
      }
    });
  }
}

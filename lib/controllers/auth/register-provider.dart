import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/models/auth/register-model.dart';
import '../../constansts/app_constants.dart';
import '../../pages/auth/otp_page.dart';
import '../../repository/register_repo.dart';

class RegisterNotifer extends ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  set obscureText(bool isObscureText) {
    _obscureText = isObscureText;
    notifyListeners();
  }

  bool passwordValidator(String password) {
    if (password.isEmpty) return false;
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool newState) {
    _isLoading = newState;
    notifyListeners();
  }

  userRegister(RegisterModel model) {
    RegiterAuth.userRegister(model).then((response) {
      if (response["status"]) {
        isLoading = false;
        Get.to(() => OtpVerificarionPage(
              email: model.email,
            ));
      } else {
        Get.snackbar("Signup Failed", "${response["error"]}",
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

  final registerFormKey = GlobalKey<FormState>();
  bool validateAndSave() {
    final form = registerFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

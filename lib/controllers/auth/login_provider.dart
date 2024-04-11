import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/util/prefrences_const.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/repository/authhelper.dart';
import 'package:job_studio/models/auth/login_model.dart';
import 'package:job_studio/pages/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  set obscureText(bool isObscureText) {
    _obscureText = isObscureText;
    notifyListeners();
  }

  // bool _firstTime = true;
  // bool get firstTime => _firstTime;
  // set firstTime(bool isFirstTime) {
  //   _firstTime = isFirstTime;
  //   notifyListeners();
  // }

  bool _entryPoint = true;
  bool get entryPoint => _entryPoint;
  set entryPoint(bool entryPoints) {
    _entryPoint = entryPoints;
    notifyListeners();
  }

  bool _loggedIn = true;
  bool get loggedIn => _loggedIn;
  set loggedIn(bool isLoggedIn) {
    _loggedIn = isLoggedIn;
    notifyListeners();
  }

  getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    entryPoint = prefs.getBool(PreferencesConstants.ENTRYPOINT) ?? false;
    loggedIn = prefs.getBool(PreferencesConstants.LOGGEDIN) ?? false;
  }

  final loginFormKey = GlobalKey<FormState>();
  bool validateAndSave() {
    final form = loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool newState) {
    _isLoading = newState;
    notifyListeners();
  }

  userLogin(LoginModel model) {
    AuthHelper.login(model).then((response) {
      if (response["status"]) {
        Get.to(() => const MainScreen());
        isLoading = false;
      } else {
        Get.snackbar("Sign Failed", "${response["error"]}",
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

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PreferencesConstants.LOGOUT, false);
    await prefs.remove(PreferencesConstants.ACCESS_TOKEN_PREFERENCES);
    // _firstTime = false;
  }
}

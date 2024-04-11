import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:job_studio/api/endpoint.dart';
import 'package:job_studio/util/prefrences_const.dart';
import 'package:job_studio/models/auth/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/base_url.dart';


class AuthHelper {
  static var clint = https.Client();
  static Future<dynamic> login(LoginModel model) async {
    Map<String, String> requiredHeaders = {'Content-Type': 'application/json'};
    var url = Config.apiUrl + Endpoint.loginUrl;
    var response = await clint.post(
      Uri.parse(url),
      headers: requiredHeaders,
      body: jsonEncode(model),
    );
    if (response.statusCode == 200 ) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = response.headers["token"]!;
      prefs.setString(PreferencesConstants.ACCESS_TOKEN_PREFERENCES, token);
      prefs.setBool(PreferencesConstants.LOGGEDIN, true);
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}

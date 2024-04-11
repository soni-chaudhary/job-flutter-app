import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:job_studio/api/endpoint.dart';
import '../api/base_url.dart';
import '../models/auth/otp_model.dart';

class VarifyOtpRepo {
  static var clint = https.Client();

  static Future<bool> otpVerifyRepo(OtpModel model) async {
    Map<String, String> requiredHeaders = {'Content-Type': 'application/json'};
    var url = Config.apiUrl + Endpoint.otpUrl;
    var response = await clint.post(
      Uri.parse(url),
      headers: requiredHeaders,
      body: jsonEncode(model),
    );
    if (response.statusCode == 200 ) {
      return true;
    } else {
      return false;
    }
  }
  static Future<bool> resendOtpRepo(String email) async {
    Map<String, String> requiredHeaders = {'Content-Type': 'application/json'};
    var url = Config.apiUrl + Endpoint.resendOtpUrl;
    var payload = {"email": email};
    var response = await clint.post(
      Uri.parse(url),
      headers: requiredHeaders,
      body: jsonEncode(payload),
    );
    if (response.statusCode == 200 ) {
      return true;
    } else {
      return false;
    }
  }
  static Future<bool> forgotPasswordRepo(
      {required String email, 
      required String password,
      required String otp,
      }) async {
    Map<String, String> requiredHeaders = {'Content-Type': 'application/json'};
    var url = Config.apiUrl + Endpoint.forgotPasswordUrl;
    var payload = {
  "otp":otp,
  "email":email,
  "password": password
};
    var response = await clint.post(
      Uri.parse(url),
      headers: requiredHeaders,
      body: jsonEncode(payload),
    );
    if (response.statusCode == 200 ) {
      return true;
    } else {
      return false;
    }
  }
}

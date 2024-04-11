import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:job_studio/api/endpoint.dart';
import 'package:job_studio/models/auth/register-model.dart';
import '../api/base_url.dart';

class RegiterAuth {
  static var clint = https.Client();

  static Future<dynamic> userRegister(RegisterModel model) async {
    Map<String, String> requiredHeaders = {'Content-Type': 'application/json'};
    var url = Config.apiUrl + Endpoint.userRegister;
    var response = await clint.post(
      Uri.parse(url),
      headers: requiredHeaders,
      body: jsonEncode(model),
    );
    if (response.statusCode == 200 ) {    
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}

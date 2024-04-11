import 'dart:io';

import 'package:job_studio/api/api_response_handling.dart';
import 'package:job_studio/api/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;

import '../util/prefrences_const.dart';

class ApiCall{
  static String baseUrl=Config.apiUrl;

  Future<Map<String, dynamic>> getCall(String endpoint) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var client = https.Client();
    String url = baseUrl + endpoint;
    try {
      var uriResponse = await client.get(
        Uri.parse(url),
        headers: {
          "tokan": preferences
              .getString(PreferencesConstants.ACCESS_TOKEN_PREFERENCES)!,
        },
      );

      if (uriResponse.statusCode == 401) {
        // bool isPresent = await getAccessToken();
        // if (isPresent) return await getCall(endpoint);
      } else {
        return ApiResponseHandler.output(uriResponse);
      }
    } on SocketException {
      return ApiResponseHandler.socketConnectionError();
    } catch (error) {
      return ApiResponseHandler.outputError();
    }
    return ApiResponseHandler.outputError();
  }
}
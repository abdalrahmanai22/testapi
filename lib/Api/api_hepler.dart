import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:testapi/app_general.dart';

class ApiHelper {
  static Future<http.Response> post({
    required String url,
    required Map<String, dynamic> body,
    bool? withToken,
    bool? withLanguage,
  }) async {
    Map<String, String> header = (withToken != null && withToken)
        ? {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization': 'Bearer ${AppGeneral.token}'
          }
        : {
            'Content-Type': 'application/json',
            'Accept': '*/*',
          };

    http.Response response = await http.post(
      Uri.parse(url),
      headers: header,
      body: json.encode(body),
    );
    // errorHandler(response);
    printData(url, response, body);
    return response;
  }

  static Future<http.Response> get({
    required String url,
    bool? withToken,
    bool? withLanguage,
  }) async {
    Map<String, String> header = (withToken != null && withToken)
        ? {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization': 'Bearer ${AppGeneral.token}'
          }
        : {
            'Content-Type': 'application/json',
            'Accept': '*/*',
          };

    http.Response response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    printData(url, response, {});
    // errorHandler(response);
    return response;
  }

  static Future<http.Response> put({
    required String url,
    Map<String, dynamic>? body,
    bool? withToken,
    bool? withLanguage,
  }) async {
    Map<String, String> header = (withToken != null && withToken)
        ? {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization': 'Bearer ${AppGeneral.token}'
          }
        : {
            'Content-Type': 'application/json',
            'Accept': '*/*',
          };

    http.Response response = body != null
        ? await http.put(
            Uri.parse(url),
            headers: header,
            body: json.encode(body),
          )
        : await http.put(
            Uri.parse(url),
            headers: header,
          );

    // errorHandler(response);
    printData(url, response, body ?? {});
    return response;
  }

  // static void errorHandler(http.Response res) {
  //   if (res.statusCode == 404) {
  //     Get.snackbar('Error', 'Not Found');
  //     return;
  //   }
  //   if (res.statusCode == 401) {
  //     Get.snackbar('Error', 'Not Found');
  //     Get.toNamed(RoutesStrings.login);
  //     return;
  //   }
  //   if (res.statusCode == 422) {
  //     Get.snackbar('Error', 'Not Found');
  //     return;
  //   }
  //   if (res.statusCode == 400) {
  //     Get.snackbar('Error', 'Not Found');
  //     return;
  //   }
  // }

  static void printData(
      String url, http.Response res, Map<String, dynamic> body) {
    log('response url: $url');
    log('--------------------------------------------------------------');
    log('response body: ${res.body}');
    log('--------------------------------------------------------------');
    log('response sent body: $body');
  }
}

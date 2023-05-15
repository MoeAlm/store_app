import 'dart:convert';

import 'package:http/http.dart';

class ApiHelper {
  Future<dynamic> getApi({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    Response response = await get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("There's an error ${response.statusCode}");
    }
  }

  Future<dynamic> postApi(
      {required String url,
      dynamic body,
      String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    Response response =
        await post(Uri.parse(url), body: body, headers: headers);
    //return jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There's an error ${response.statusCode} with body ${jsonDecode(response.body )}");
    }
  }

  Future<dynamic> putApi(
      {required String url,
        dynamic body,
        String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    Response response =
    await put(Uri.parse(url), body: body, headers: headers);
    //return jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There's an error ${response.statusCode} with body ${jsonDecode(response.body )}");
    }
  }
}

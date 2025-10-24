import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class API {
  //( get method for api ثابتة )that contain http request and status code for any get request
  Future<http.Response> get({required String url}) async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }

  //  post method for api ثابتة
  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      //  so that contain ath in headers
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    //  convert data theat i will send to map of json data

    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }

  //  put method to update product

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      //  so that contain ath in headers
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    //  to chech the operation
    print('URL= $url , BODY= $body');

    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    //  convert data theat i will send to map of json data

    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';





class NetworkCaller {
  final Logger _logger = Logger();
  final Map<String, String> headers;
  final VoidCallback onUnauthorize;

  NetworkCaller( {required this.headers,required this.onUnauthorize});

  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url);

      Response response = await get(uri, headers: headers);

      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        onUnauthorize();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          body: decodedData,
          errorMessage: "Unauthorized"
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          body: decodedData["msg"],
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
  // POST Request Method
  Future<NetworkResponse> postRequest(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, body: body);

      Response response = await post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          ...headers,
        },
        body: jsonEncode(body),
      );

      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        onUnauthorize();

        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          body: decodedData,
          errorMessage:
          decodedData["msg"]?.toString() ?? "Unauthorized",
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          body: decodedData,
          errorMessage:
          decodedData["msg"]?.toString() ?? "Something went wrong",
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      "URL: $url\n"
          "Body: $body",
    );
  }

  void _logResponse(String url, Response response) {
    _logger.i(
      "URL: $url\n"
          "Status Code: ${response.statusCode}\n"
          "Body: ${response.body}",
    );
  }


}


class NetworkResponse {
  final bool isSuccess;
  final int? statusCode;
  final dynamic body;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    this.statusCode,
    this.body,
    this.errorMessage,
  });
}








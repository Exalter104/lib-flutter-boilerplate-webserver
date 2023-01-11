// ignore_for_file: unused_local_variable
import 'dart:convert';
import 'package:http/http.dart';
import 'dart:io';
import 'package:flutter_boilerplate_webserver/data/app_exception.dart';
import 'package:flutter_boilerplate_webserver/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

// getApi  for webserver

class NetworkApiServces extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Exception");
    }
    return responseJson;
  }

// getApi  for webserver

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Exception");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadrequestException(response.body.toString());
      case 404:
        throw UnautherisedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occured while communication with serverwith status code ${response.statusCode}");
    }
  }
}

import 'package:flutter_boilerplate_webserver/data/network/BaseApiServices.dart';
import 'package:flutter_boilerplate_webserver/data/network/NetworkApiServices.dart';
import 'package:flutter_boilerplate_webserver/utils/components/app_url.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiServces();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

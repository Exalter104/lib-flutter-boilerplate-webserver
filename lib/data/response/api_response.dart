// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_boilerplate_webserver/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({
    this.status,
    this.data,
    this.message,
  });

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "status: $status \n Message : $message \n Data: $data";
  }
}

import 'package:dio/dio.dart';
import 'package:todo_drf/core/urls.dart';

class HttpClient {
  static late final Dio api;

  static void init() {
    api = Dio()..options.baseUrl = Urls.api;
    api.options.headers.addAll({'content-type': 'application/json'});
  }
}

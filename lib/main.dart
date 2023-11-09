import 'package:flutter/material.dart';
import 'package:todo_drf/app.dart';
import 'package:todo_drf/core/http_client.dart';
import 'package:todo_drf/service/todo_service.dart';

void main() {
  HttpClient.init();
  TodoService();
  runApp(const App());
}

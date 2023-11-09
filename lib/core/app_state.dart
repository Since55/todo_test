import 'package:flutter/material.dart';
import 'package:todo_drf/models/todo.dart';

class AppState extends ChangeNotifier {
   List<Todo> todos = [];
   int conutner = 0;
}
import 'package:get/get.dart';
import 'package:todo_drf/pages/todos/controller/todos_controller.dart';
import 'package:todo_drf/pages/todos/todos_page.dart';

class AppRouter {
  static const String initialRoute = '/';

  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => TodosPage(),
      binding: TodosBinding(),
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_drf/core/app_router.dart';
import 'package:todo_drf/core/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo DRF',
      theme: AppTheme.theme,
      getPages: AppRouter.pages,
      initialRoute: AppRouter.initialRoute,
    );
  }
}

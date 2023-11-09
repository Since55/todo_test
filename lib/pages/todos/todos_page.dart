import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_drf/pages/todos/controller/todos_controller.dart';
import 'package:todo_drf/pages/todos/view/todo_card.dart';

class TodosPage extends GetView<TodosController> {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodosPage'),
      ),
      body: SafeArea(
        child: GetBuilder<TodosController>(
          builder: (_) => ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.todos.length,
            itemBuilder: (context, index) => TodoCard(
              todo: controller.todos[index], 
              onToggleComplete: controller.toggleComplete,
              onDelete: controller.deleteTodo,
            ),
          ),
        ),
      ),
    );
  }
}

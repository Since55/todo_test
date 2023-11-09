import 'package:get/get.dart';
import 'package:todo_drf/core/event_chanel.dart';
import 'package:todo_drf/events/events.dart';
import 'package:todo_drf/models/todo.dart';
import 'package:todo_drf/service/counter_service.dart';

class TodosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodosController>(() => TodosController());
  }
}

class TodosController extends GetxController {
  
  List<Todo> todos = [];

  @override
  void onInit() {
    getTodos();
    super.onInit();
  }

  counterService.count

  Future<void> getTodos() async {
    final effect = await eventChannel.fire(OpenTodoListEvent());
    if (effect is List<Todo>) todos = effect;
    update();
  }

  Future<void> toggleComplete(Todo todo) async {
    await eventChannel.fire(ToggleTodoCheckboxEvent(todo));
    todos[todos.indexOf(todo)] = todo.copyWith(completed: true);
    update();
  }

  Future<void> deleteTodo(Todo todo) async {
    todos.remove(todo);
    eventChannel.fire(DeleteTodoEvent(todo));
    update();
  }
}

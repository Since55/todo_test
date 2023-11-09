import 'package:todo_drf/api/todo_api.dart';
import 'package:todo_drf/core/event_chanel.dart';
import 'package:todo_drf/events/events.dart';
import 'package:todo_drf/models/todo.dart';

class TodoService {
  List<Todo> todos = [];

  TodoService() {
    eventChannel
      ..on<OpenTodoListEvent>().listen(getTodos)
      ..on<DeleteTodoEvent>().listen(deleteTodo)
      ..on<ToggleTodoCheckboxEvent>().listen(toggleComplete);
  }

  Future<void> getTodos(OpenTodoListEvent event) async {
    todos = await TodoApi.getTodos();
    event.resolve(todos);
    eventChannel.fire(UpdatedTodoListEvent(todos));
  }

  Future<void> toggleComplete(ToggleTodoCheckboxEvent event) async {
    await TodoApi.toggleCompleteTodo(event.item);
    event.resolve();
  }

  Future<void> deleteTodo(DeleteTodoEvent event) async {
    await TodoApi.deleteTodo(event.item);
    todos = await TodoApi.getTodos();
  }
}

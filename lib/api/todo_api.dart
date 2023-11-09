import 'package:todo_drf/models/todo.dart';

class TodoApi {
  static List<Todo> todos = List.generate(
    50,
    (index) => Todo(
      id: index,
      title: 'title$index',
      description: 'DESCrodjhsajf klahfdalksjhf $index',
    ),
  );

  static Future<List<Todo>> getTodos() async {
    await Future.delayed(const Duration(seconds: 1));

    return todos;
  }

  static Future<void> toggleCompleteTodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));
    final idx = todos.indexOf(todo);
    if (idx >= 0) {
      todos[idx] = todo.copyWith(completed: !todo.completed);
    } else {
      throw Exception('todo not found');
    }
  }

  static Future<void> deleteTodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));
    todos.remove(todo);
  }
}

import 'package:todo_drf/core/event_chanel.dart';
import 'package:todo_drf/models/todo.dart';

class UpdatedTodoListEvent extends Event {
  final List<Todo> items;
  UpdatedTodoListEvent(this.items);
}

class OpenTodoListEvent extends AsyncEvent {}

class ToggleTodoCheckboxEvent extends AsyncEvent {
  final Todo item;
  ToggleTodoCheckboxEvent(this.item);
}

class DeleteTodoEvent extends Event {
  final Todo item;
  DeleteTodoEvent(this.item);
}
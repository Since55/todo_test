import 'package:flutter/material.dart';
import 'package:todo_drf/models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final void Function(Todo)? onToggleComplete;
  final void Function(Todo)? onDelete;

  const TodoCard({
    required this.todo,
    this.onToggleComplete,
    this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      onDismissed: (direction) => onDelete?.call(todo),
      child: Card(
        child: ExpansionTile(
          expandedAlignment: Alignment.topLeft,
          title: Row(
            children: [
              Text(todo.title),
              const Spacer(),
              Checkbox(
                value: todo.completed,
                onChanged: (_) => onToggleComplete?.call(todo),
              )
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                todo.description,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

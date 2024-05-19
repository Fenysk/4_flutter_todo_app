import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.todos, required this.onToggleDone});

  final List<Todo> todos;
  final void Function(String id) onToggleDone;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Dismissible(
          key: ValueKey(todo.id),
          onDismissed: (direction) => onToggleDone(todo.id),
          child: TodoItem(
            todo: todo,
          ),
        );
      },
    );
  }
}

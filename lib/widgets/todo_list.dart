import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.todos, required this.onToggleDone});

  final List<Todo> todos;
  final void Function(String id) onToggleDone;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.todos.length,
      itemBuilder: (context, index) {
        final todo = widget.todos[index];
        return Dismissible(
          key: ValueKey(todo.id),
          onDismissed: (direction) => widget.onToggleDone(todo.id),
          child: TodoItem(
            todo: todo,
          ),
        );
      },
    );
  }
}

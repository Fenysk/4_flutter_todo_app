import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList(this.todos, {super.key, required this.onToggleDone});

  final List<Todo> todos;
  final void Function(String id, bool isDone) onToggleDone;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void onToggleDone(String id, bool isDone) {
    setState(() {
      widget.onToggleDone(id, isDone);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todos.length,
      itemBuilder: ((context, index) => TodoItem(
            todo: widget.todos[index],
            onToggleDone: onToggleDone,
          )),
    );
  }
}

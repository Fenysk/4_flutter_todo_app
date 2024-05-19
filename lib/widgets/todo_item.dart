import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.todo, required this.onToggleDone});

  final Todo todo;
  final void Function(String id, bool isDone) onToggleDone;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  void _setDone(bool? isChecked) {
    setState(() {
      widget.onToggleDone(widget.todo.id, isChecked!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.todo.done,
          onChanged: _setDone,
        ),
        Text(widget.todo.priorityEmoji),
        const SizedBox(width: 8.0),
        Text(
          widget.todo.text,
          style: TextStyle(
            decoration: widget.todo.done ? TextDecoration.lineThrough : null,
            fontWeight:
                !widget.todo.done && widget.todo.priority == Priority.high
                    ? FontWeight.bold
                    : null,
          ),
        ),
      ],
    );
  }
}

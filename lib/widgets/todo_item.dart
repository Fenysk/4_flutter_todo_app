import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(widget.todo.priorityEmoji),
            const SizedBox(width: 8.0),
            Text(
              widget.todo.text,
              style: TextStyle(
                decoration:
                    widget.todo.done ? TextDecoration.lineThrough : null,
                fontWeight:
                    !widget.todo.done && widget.todo.priority == Priority.high
                        ? FontWeight.bold
                        : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

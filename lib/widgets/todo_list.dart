import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList(this.todos, {super.key, required this.onToggleDone});

  final List<Todo> todos;
  final void Function(String id) onToggleDone;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void toggleDone(String id) => setState(() => widget.onToggleDone(id));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: ((context, index) => Dismissible(
              key: ValueKey(widget.todos[index].id),
              onDismissed: (direction) => toggleDone(widget.todos[index].id),
              child: TodoItem(
                todo: widget.todos[index],
              ),
            )),
      ),
    );
  }
}

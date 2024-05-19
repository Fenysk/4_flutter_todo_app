import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    super.key,
    required this.todos,
    required this.onToggleDone,
    required this.onRemoveTodo,
  });

  final List<Todo> todos;
  final void Function(String id) onToggleDone;
  final void Function(String id) onRemoveTodo;

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
          background: Container(
            color: Colors.green,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: !todo.done
                ? const Icon(Icons.check, color: Colors.white)
                : const Icon(Icons.undo, color: Colors.white),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              widget.onRemoveTodo(todo.id);
              return true;
            } else if (direction == DismissDirection.startToEnd) {
              widget.onToggleDone(todo.id);
              return true;
            }
            return false;
          },
          child: TodoItem(
            todo: todo,
          ),
        );
      },
    );
  }
}

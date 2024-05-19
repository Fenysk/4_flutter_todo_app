import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/data/todos_data.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  TodoApp({super.key});

  final List<Todo> myTodos = List.of(todosData);

  void toogleDone(String id, bool isDone) {
    final todo = myTodos.firstWhere((todo) => todo.id == id);
    todo.done = isDone;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
        ),
        body: Center(
          child: TodoList(myTodos, onToggleDone: toogleDone),
        ),
      ),
    );
  }
}

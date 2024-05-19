import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/data/todos_data.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  void toggleDone(String id) {
    setState(() {
      final todo = todosData.firstWhere((todo) => todo.id == id);
      todo.done = !todo.done;
    });
  }

  List<Todo> get notDoneTodos {
    return todosData.where((todo) => !todo.done).toList();
  }

  List<Todo> get doneTodos {
    return todosData.where((todo) => todo.done).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
        ),
        body: Center(
          child: Column(
            children: [
              TodoList(
                notDoneTodos,
                onToggleDone: toggleDone,
              ),
              const SizedBox(height: 20),
              TodoList(
                doneTodos,
                onToggleDone: toggleDone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

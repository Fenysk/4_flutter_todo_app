import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/data/todos_data.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
        ),
        body: const TodoScreen(),
      ),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
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
    return Center(
      child: Column(
        children: [
          TodoList(
            todos: notDoneTodos,
            onToggleDone: toggleDone,
          ),
          const Divider(),
          TodoList(
            todos: doneTodos,
            onToggleDone: toggleDone,
          ),
          const Spacer()
        ],
      ),
    );
  }
}

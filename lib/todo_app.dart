import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/data/todos_data.dart';
import 'package:todo_app/widgets/add_new_todo_modal.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  void _toggleDone(String id) {
    setState(() {
      final todo = todosData.firstWhere((todo) => todo.id == id);
      todo.done = !todo.done;
    });
  }

  List<Todo> get _notDoneTodos {
    return todosData.where((todo) => !todo.done).toList();
  }

  List<Todo> get _doneTodos {
    return todosData.where((todo) => todo.done).toList();
  }

  void _openAddTodoOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (modalContext) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddNewTodoModal(onAddNewTodo: _addNewTodo),
        );
      },
      isScrollControlled: true,
      useSafeArea: true,
    );
  }

  void _addNewTodo(Todo newTodo) {
    setState(() {
      todosData.add(newTodo);
    });
  }

  void _removeTodo(String id) {
    setState(() {
      todosData.removeWhere((todo) => todo.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddTodoOverlay,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            _notDoneTodos.isNotEmpty
                ? TodoList(
                    todos: _notDoneTodos,
                    onRemoveTodo: _removeTodo,
                    onToggleDone: _toggleDone,
                  )
                : const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('No tasks pending'),
                  ),
            if (_notDoneTodos.isNotEmpty && _doneTodos.isNotEmpty)
              const Divider(),
            _doneTodos.isNotEmpty
                ? TodoList(
                    todos: _doneTodos,
                    onRemoveTodo: _removeTodo,
                    onToggleDone: _toggleDone,
                  )
                : const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('No completed tasks'),
                  ),
          ],
        ),
      ),
    );
  }
}

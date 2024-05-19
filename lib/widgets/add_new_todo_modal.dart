import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class AddNewTodoModal extends StatefulWidget {
  const AddNewTodoModal({super.key, required this.onAddNewTodo});

  final void Function(Todo newTodo) onAddNewTodo;

  @override
  State<AddNewTodoModal> createState() => _AddNewTodoModalState();
}

class _AddNewTodoModalState extends State<AddNewTodoModal> {
  final TextEditingController textController = TextEditingController();
  Priority priority = Priority.normal;

  String getPriorityLabel(Priority priority) {
    switch (priority) {
      case Priority.low:
        return 'Peu important';
      case Priority.normal:
        return 'Important';
      case Priority.high:
        return 'Urgent';
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erreur'),
          content: const Text('Veuillez saisir un texte pour la tâche.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _submitNewTodoData() {
    final textIsValid = textController.text.isNotEmpty;

    if (!textIsValid) _showErrorDialog();

    widget.onAddNewTodo(
      Todo(
        text: textController.text,
        priority: priority,
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          maxLines: 3,
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Qu\'avez-vous en tête ?',
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...Priority.values.map((priority) => Column(
                  children: [
                    Radio<Priority>(
                      value: priority,
                      groupValue: this.priority,
                      onChanged: (value) {
                        setState(() => this.priority = value!);
                      },
                    ),
                    Text(getPriorityLabel(priority)),
                  ],
                )),
          ],
        ),
        ElevatedButton(
          onPressed: _submitNewTodoData,
          child: const Text('Ajouter'),
        ),
      ],
    );
  }
}

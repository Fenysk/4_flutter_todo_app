import 'package:uuid/uuid.dart';

enum Priority { low, normal, high }

const uuid = Uuid();

get newUuid => 'todo_${uuid.v4().replaceAll('-', '').substring(0, 8)}';

const Map<Priority, String> priorityEmojis = {
  Priority.low: '🟢',
  Priority.normal: '🟡',
  Priority.high: '🔴',
};

class Todo {
  Todo({
    required this.text,
    this.priority = Priority.normal,
    this.done = false,
  });

  final String id = newUuid;
  final String text;
  final Priority priority;
  bool done;

  get priorityEmoji => priorityEmojis[priority];
}

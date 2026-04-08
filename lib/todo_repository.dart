import 'todo.dart';

class TodoRepository {
  final List<Todo> _todos = [];

  List<Todo> getAll() {
    return _todos;
  }

  void add(String title) {
    if (title.trim().isEmpty) {
      throw ArgumentError('task is empty');
    }
    Todo todo = Todo(title.trim());
    _todos.add(todo);
  }

  void complete(int id) {
    for (var todo in _todos) {
      if (todo.id == id) {
        todo.isDone = true;
        return;
      }
      throw ArgumentError(' task with $id not found');
    }
  }

  void delete(int id) {
    for (int i = 0; i < _todos.length; i++) {
      if (_todos[i].id == id) {
        _todos.removeAt(i);
        return;
      }
    }
  }
}

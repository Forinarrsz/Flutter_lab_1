// void main() {
//   print('hello, world!');
//   //x = fkqw;
//   final id = 1;
//   const app = "ToDo";

//   print('$id');

//   List<String> test = ['app', 'program'];
//   Map<String, dynamic> data = {'key': 13};

//   Set<int> id2 = {1, 2, 3};

// }

import 'dart:io';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todo_repository.dart';

void main() {
  TodoRepository repo = TodoRepository();
  printMenu();
  while (true) {
    stdout.write("> ");
    String input = stdin.readByteSync();
    if (input == null) {
      continue;
    }
    input = input.trim();
    if (input.isEmpty) {
      continue;
    }
    bool shouldExit = handleCommand(repo, input);
    if (shouldExit) {
      break;
    }
  }
}

void printMenu() {
  print('Console app TODO');
  print('commands:');
  print('add <text>');\
  print('list');
  print('done <id>');
  print('delete <id>');
  print('exit');
  print('');
}

void addCommand(TodoRepository repo, String input) {
  if (input.length <= 4) {
    print("error: enter text");
    return;
  }
  String title = input.substring(4).trim();
  repo.add(title);
  print("task added");
}

void listCommand(TodoRepository repo) {
  List<Todo> todos = repo.getAll();
  if (todos.isEmpty) {
    print('todo is empty');
    return;
  }
  for (var todo in todos){
    print(todo);
  }
}

void doneCommand(TodoRepository repo, List<String> parts) {
  if (parts.length < 2)
  {
    print('error: enter id');
    return;
  }
  int id = int.parse(parts[1]);
  repo.complete(id);
  print('task done');
}
void deleteCommand(TodoRepository repo, List<String> parts) {
  
  if (parts.length < 2)
  {
    print('error: enter id');
    return;
  }
  int id = int.parse(parts[1]);
  repo.delete(id);
  print('task deleted');
}

bool handleCommand(TodoRepository repo, String input) {
  List<String> parts = input.split(' ');
  String command = parts[0].toLowerCase();

  try {
    switch(command) {
      case "add":
      addCommand(repo, input);
      break;
      case "list":
      listCommand(repo);
      break;
      case "done":
      doneCommand(repo, parts);
      break;
      case "delete":
      deleteCommand(repo, parts);
      break;
      case "exit":
      print("exit");
      return true;
      default:
      print('not found');
    }
  } catch (e) {
    print("error: $e");
  } return false;
}
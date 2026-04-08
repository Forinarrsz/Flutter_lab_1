import 'dart:io';
Future<String> readUserInput() async {
  print('enter something');
  return stdin.readLineSync() ?? '';
}

Future<List<String>> fetchTodos() async {
  await Future.delayed(Duration(seconds: 1));
  return ['Remote todo 1', 'Remote Todo 2'];
}

void main() async {
  final input = await readUserInput();
  print('your enter: $input');
  print('loading....');

  final todos = await fetchTodos();
  todos.forEach(print);
}

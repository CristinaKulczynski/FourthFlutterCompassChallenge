import 'package:flutter/material.dart';
import 'package:todolist/screens/tela_todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TODO List',
      debugShowCheckedModeBanner: false,
      /*Tirar debug da tela*/
      home: TelaTODOList(),
    );
  }
}

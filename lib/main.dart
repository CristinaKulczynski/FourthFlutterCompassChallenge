import 'package:flutter/material.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/screens/tela_principal_todo_list.dart';

void main() {
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TarefasBloc()
        ..add(AdicionarTarefa(
          tarefa: Tarefa(titulo: 'Comer abacate'),
        )),
      child: MaterialApp(
        title: 'TODO List',
        debugShowCheckedModeBanner: false,
        /*Tirar debug da tela*/
        home: TelaTODOList(),
      ),
    );
  }
}

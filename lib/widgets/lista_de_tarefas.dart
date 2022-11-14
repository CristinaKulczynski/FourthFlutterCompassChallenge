import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';

class ListaDeTarefas extends StatelessWidget {
  const ListaDeTarefas({
    Key? key,
    required this.listaDeTarefas,
  }) : super(key: key);

  final List<Tarefa> listaDeTarefas;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listaDeTarefas.length,
        itemBuilder: ((context, index) {
          var Tarefa = listaDeTarefas[index];
          return ListTile(
            title: Text(Tarefa.titulo),
            trailing: Checkbox(
              value: Tarefa.isConcluida,
              onChanged: ((value) {}),
            ),
          );
        }),
      ),
    );
  }
}

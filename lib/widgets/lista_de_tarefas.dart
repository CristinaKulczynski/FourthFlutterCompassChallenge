import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/widgets/tarefa_tile.dart';

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
          var tarefa = listaDeTarefas[index];
          return TarefaTile(tarefa: tarefa);
        }),
      ),
    );
  }
}

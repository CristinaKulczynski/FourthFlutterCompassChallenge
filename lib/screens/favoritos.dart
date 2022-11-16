import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/widgets/lista_de_tarefas.dart';
import '../blocs/exportacao_do_bloc.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({Key? key}) : super(key: key);
  static const id = 'tela_todo_list';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TarefasBloc, TarefasState>(
      builder: (context, state) {
        List<Tarefa> listaDeTarefas = state.listaTarefasFavoritas;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${listaDeTarefas.length} Tasks',
                ),
              ),
            ),
            ListaDeTarefas(listaDeTarefas: listaDeTarefas),
          ],
        );
      },
    );
  }
}

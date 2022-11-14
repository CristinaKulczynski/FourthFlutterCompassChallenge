import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/widgets/lista_de_tarefas.dart';

import '../blocs/exportacao_do_bloc.dart';

class TelaTODOList extends StatelessWidget {
  TelaTODOList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TarefasBloc, TarefasState>(
      builder: (context, state) {
        List<Tarefa> listaDeTarefas = state.listaDeTodasTarefas;
        return Scaffold(
            appBar: AppBar(
              title: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'TODO List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Chip(
                    label: Text(
                      'Tasks:',
                    ),
                  ),
                ),
                ListaDeTarefas(listaDeTarefas: listaDeTarefas),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            ));
      },
    );
  }
}

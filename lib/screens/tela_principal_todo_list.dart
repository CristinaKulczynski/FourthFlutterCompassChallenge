import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/widgets/lista_de_tarefas.dart';
import 'package:todolist/screens/adicionar_tarefa.dart';
import '../blocs/exportacao_do_bloc.dart';

// ignore: must_be_immutable
class TelaTODOList extends StatelessWidget {
  TelaTODOList({Key? key}) : super(key: key);

  TextEditingController tituloController = TextEditingController();

  void _adicionarTarefa(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AdicionarATarefa(tituloController: tituloController),
      ),
    );
  }

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
              onPressed: () => _adicionarTarefa(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            ));
      },
    );
  }
}

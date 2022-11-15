import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/screens/menu_lateral.dart';
import 'package:todolist/widgets/lista_de_tarefas.dart';
import 'package:todolist/screens/adicionar_a_tarefa.dart';
import '../blocs/exportacao_do_bloc.dart';

// ignore: must_be_immutable
class TelaTODOList extends StatefulWidget {
  const TelaTODOList({Key? key}) : super(key: key);
  // Método estático é uma porta de uma classe ao invés de fazer parte de uma instância especifica
  static const id = 'tela_principal_todo_list';

  @override
  State<TelaTODOList> createState() => _TelaTODOListState();
}

class _TelaTODOListState extends State<TelaTODOList> {
  void _adicionarTarefa(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AdicionarATarefa(),
        ),
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
                  onPressed: () => _adicionarTarefa(context),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            drawer: const MenuLateral(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    label: Text(
                      // Mostra quantas tarefas temos
                      '${state.listaDeTodasTarefas.length} Tasks',
                    ),
                  ),
                ),
                ListaDeTarefas(listaDeTarefas: listaDeTarefas),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _adicionarTarefa(context),
              tooltip: 'Adicione Tarefa',
              child: const Icon(Icons.add),
            ));
      },
    );
  }
}

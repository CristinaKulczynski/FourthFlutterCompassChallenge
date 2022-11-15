import 'package:flutter/material.dart';
import 'package:todolist/screens/adicionar_a_tarefa.dart';
import 'package:todolist/screens/menu_lateral.dart';
import 'package:todolist/screens/tela_principal_todo_list.dart';

class PrincipalTodoList extends StatelessWidget {
  const PrincipalTodoList({super.key});
  static const id = 'principal_todo_list';

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
      drawer: MenuLateral(),
      body: const TelaTODOList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _adicionarTarefa(context),
        tooltip: 'Adicione Tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }
}

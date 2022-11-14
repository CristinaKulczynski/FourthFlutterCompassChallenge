import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';

class TelaTODOList extends StatelessWidget {
  TelaTODOList({Key? key}) : super(key: key);

  // Lista temporária para teste
  List<Tarefa> listaDeTarefas = [
    Tarefa(titulo: 'Tarefa1'),
    Tarefa(titulo: 'Tarefa2'),
    Tarefa(titulo: 'Tarefa3'),
  ];

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
            Expanded(
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
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ));
  }
}

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
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: listaDeTarefas
              .map((tarefa) => ExpansionPanelRadio(
                  value: tarefa.id,
                  headerBuilder: (context, isOpen) =>
                      TarefaTile(tarefa: tarefa),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Título: \n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: tarefa.titulo),
                      const TextSpan(
                        text: '\nDescrição: \n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: tarefa.descricao),
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}

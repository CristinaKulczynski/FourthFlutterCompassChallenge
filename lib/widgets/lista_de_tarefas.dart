import 'package:flutter/material.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
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
          var tarefa = listaDeTarefas[index];
          return ListTile(
            title: Text(
              tarefa.titulo,
              style: TextStyle(
                  // Se a tarefa estiver concluida ficara riscada
                  decoration:
                      tarefa.isConcluida! ? TextDecoration.lineThrough : null),
            ),
            trailing: Checkbox(
              value: tarefa.isConcluida,
              onChanged: (value) {
                context
                    .read<TarefasBloc>()
                    .add(AtualizarTarefa(tarefa: tarefa));
              },
            ),
            onLongPress: () =>
                context.read<TarefasBloc>().add(ExcluirTarefa(tarefa: tarefa)),
          );
        }),
      ),
    );
  }
}

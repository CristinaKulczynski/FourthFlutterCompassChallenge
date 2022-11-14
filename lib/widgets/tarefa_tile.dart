import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';

import '../blocs/exportacao_do_bloc.dart';

class TarefaTile extends StatelessWidget {
  const TarefaTile({
    Key? key,
    required this.tarefa,
  }) : super(key: key);

  final Tarefa tarefa;

  @override
  Widget build(BuildContext context) {
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
          context.read<TarefasBloc>().add(AtualizarTarefa(tarefa: tarefa));
        },
      ),
      onLongPress: () =>
          context.read<TarefasBloc>().add(ExcluirTarefa(tarefa: tarefa)),
    );
  }
}

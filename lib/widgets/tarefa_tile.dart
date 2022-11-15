import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/tarefa.dart';

import '../blocs/exportacao_do_bloc.dart';

class TarefaTile extends StatelessWidget {
  const TarefaTile({
    Key? key,
    required this.tarefa,
  }) : super(key: key);

  final Tarefa tarefa;

  void _excluirOuRemoverTarefa(BuildContext contet, Tarefa tarefa) {
    tarefa.isDeletada!
        ? contet.read<TarefasBloc>().add(ExcluirTarefa(tarefa: tarefa))
        : contet.read<TarefasBloc>().add(RemoveTarefa(tarefa: tarefa));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.star_outline),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tarefa.titulo,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          // Se a tarefa estiver concluida ficara riscada
                          decoration: tarefa.isConcluida!
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                    //Text(DateFormat().add_yMEd().format(DateTime.now())),
                    //Text(DateFormat('dd/MM/yyyy').format(DateTime.now())),
                    Text(DateFormat().add_yMMMd().format(DateTime.now())),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: tarefa.isConcluida,
                onChanged: (value) {
                  context
                      .read<TarefasBloc>()
                      .add(AtualizarTarefa(tarefa: tarefa));
                },
              ),
              PopupMenuButton(
                itemBuilder: ((context) => [
                      PopupMenuItem(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                          label: const Text('Editar'),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ListTile(
//       title: Text(
//         tarefa.titulo,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//             // Se a tarefa estiver concluida ficara riscada
//             decoration:
//                 tarefa.isConcluida! ? TextDecoration.lineThrough : null),
//       ),
//       trailing: Checkbox(
//         value: tarefa.isConcluida,
//         onChanged: (value) {
//           context.read<TarefasBloc>().add(AtualizarTarefa(tarefa: tarefa));
//         },
//       ),
//       onLongPress: () => _excluirOuRemoverTarefa(context, tarefa),
//     );
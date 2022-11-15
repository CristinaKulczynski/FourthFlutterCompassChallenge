import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/widgets/botao_pop_up.dart';

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
              tarefa.isFavorita == false
                  ? const Icon(Icons.star_outline)
                  : const Icon(Icons.star),
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
                    Text(DateFormat()
                        .add_yMMMd()
                        .format(DateTime.parse(tarefa.data))),
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
              BotaoPopUp(
                tarefa: tarefa,
                cancelarOuDeletar: () =>
                    _excluirOuRemoverTarefa(context, tarefa),
                favoritaOuNao: () => context.read<TarefasBloc>().add(
                      FavoritasOnOff(tarefa: tarefa),
                    ),
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
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/screens/editar_a_tarefa.dart';
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

  void _editarATarefa(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: EditarATarefa(
            todasTarefas: tarefa,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                tarefa.isFavorita == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tarefa.titulo,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: tarefa.isConcluida!
                                  ? TextDecoration.lineThrough
                                  : null)),
                      Text(
                        DateFormat()
                            .add_yMMMd()
                            .format(DateTime.parse(tarefa.data)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: tarefa.isConcluida,
                onChanged: tarefa.isDeletada == false
                    ? (value) {
                        context
                            .read<TarefasBloc>()
                            .add(AtualizarTarefa(tarefa: tarefa));
                      }
                    : null,
              ),
              BotaoPopUp(
                tarefa: tarefa,
                cancelarOuDeletar: () =>
                    _excluirOuRemoverTarefa(context, tarefa),
                favoritaOuNao: () => context.read<TarefasBloc>().add(
                      FavoritasOnOff(tarefa: tarefa),
                    ),
                editar: () {
                  Navigator.of(context).pop();
                  _editarATarefa(context);
                },
                restaurar: () => context
                    .read<TarefasBloc>()
                    .add(RestaurarTarefa(tarefa: tarefa)),
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
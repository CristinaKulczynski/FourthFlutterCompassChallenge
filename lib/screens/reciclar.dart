import 'package:flutter/material.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/screens/menu_lateral.dart';
import 'package:todolist/widgets/lista_de_tarefas.dart';

class Reciclar extends StatelessWidget {
  const Reciclar({super.key});

  static const id = 'reciclar';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TarefasBloc, TarefasState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text('Reciclar lixeira',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            child: TextButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.delete_forever),
                              label: const Text('Exclua todas as tarefas'),
                            ),
                            onTap: () => context
                                .read<TarefasBloc>()
                                .add(ExcluiTodasTarefas())),
                      ])
            ],
          ),
          drawer: const MenuLateral(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    ' ${state.tarefasRemovidas.length} Tarefas',
                  ),
                ),
              ),
              ListaDeTarefas(listaDeTarefas: state.tarefasRemovidas),
            ],
          ),
        );
      },
    );
  }
}

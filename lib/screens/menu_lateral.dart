import 'package:flutter/material.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/screens/Reciclar.dart';
import 'package:todolist/screens/tela_todo_list.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
              color: Colors.pink,
              child: Text('Menu de opções',
                  style: Theme.of(context).textTheme.headline5),
            ),
            BlocBuilder<TarefasBloc, TarefasState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    TelaTODOList.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('Tarefas'),
                    trailing: Text(
                        '${state.listaTarefasPendentes.length} | ${state.listaTarefasConcluidas.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TarefasBloc, TarefasState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    Reciclar.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Lixeira'),
                    trailing: Text('${state.tarefasRemovidas.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<BotaoBloc, BotaoState>(
              builder: (context, state) {
                return Switch(
                  value: state.botaoValor,
                  onChanged: (novoValor) {
                    novoValor
                        ? context.read<BotaoBloc>().add(BotaoAtivadoEvent())
                        : context.read<BotaoBloc>().add(BotaoDesativadoEvent());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

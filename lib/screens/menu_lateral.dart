import 'package:flutter/material.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/screens/Reciclar.dart';
import 'package:todolist/screens/principal_todo_list.dart';

// ignore: must_be_immutable
class MenuLateral extends StatelessWidget {
  MenuLateral({super.key});

  bool switchValor = false;

  @override
  Widget build(BuildContext context) {
    // SafeArea para tornar o Drawer dinâmico e adaptável
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
              color: Colors.grey,
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
                    title: const Text('Reciclar'),
                    trailing: Text('${state.listaDeTodasTarefas.length}'),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed(
                Reciclar.id,
              ),
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text('Lixeira'),
                trailing: Text('0'),
              ),
            ),
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
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/models/tarefa.dart';

class AdicionarATarefa extends StatelessWidget {
  const AdicionarATarefa({
    Key? key,
    required this.tituloController,
  }) : super(key: key);

  final TextEditingController tituloController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        // Consulta de mídia da visualização.
        // Inserções na parte inferior
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Adicionar Tarefa',
              style: TextStyle(fontSize: 24),
            ),
          ),
          TextField(
            autofocus: true,
            controller: tituloController,
            decoration: const InputDecoration(
              label: Text('Título'),
              border: OutlineInputBorder(),
            ),
          ),
          // Apenas sai do ShowModalBottomSheet
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('cancelar'),
          ),
          // Cria variável tarefa, chama o tarefas_event para adicionar na lista
          ElevatedButton(
            onPressed: () {
              var tarefa = Tarefa(
                titulo: tituloController.text,
              );
              // Metodo para criar adicionar tarefa
              context.read<TarefasBloc>().add(AdicionarTarefa(tarefa: tarefa));
            },
            child: const Text('Salvar'),
          ),
        ]),
      ),
    );
  }
}

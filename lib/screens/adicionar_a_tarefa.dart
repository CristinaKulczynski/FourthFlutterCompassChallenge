import 'package:flutter/material.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/services/gerador_de_numeros.dart';

class AdicionarATarefa extends StatelessWidget {
  const AdicionarATarefa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController tituloController = TextEditingController();
    TextEditingController descricaoController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text(
          'Adicionar Tarefa',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: TextField(
            autofocus: true,
            controller: tituloController,
            decoration: const InputDecoration(
              label: Text('Título'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        TextField(
          autofocus: true,
          controller: descricaoController,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
            label: Text('Descrição'),
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                var tarefa = Tarefa(
                  titulo: tituloController.text,
                  descricao: descricaoController.text,
                  id: geradorId(),
                  data: DateTime.now().toString(),
                );
                context
                    .read<TarefasBloc>()
                    .add(AdicionarTarefa(tarefa: tarefa));
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ]),
    );
  }
}

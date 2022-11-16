import 'package:flutter/material.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/models/tarefa.dart';

class EditarATarefa extends StatefulWidget {
  final Tarefa todasTarefas;
  const EditarATarefa({
    Key? key,
    required this.todasTarefas,
  }) : super(key: key);

  @override
  State<EditarATarefa> createState() => _EditarATarefaState();
}

class _EditarATarefaState extends State<EditarATarefa> {
  @override
  Widget build(BuildContext context) {
    TextEditingController tituloController =
        TextEditingController(text: widget.todasTarefas.titulo);
    TextEditingController descricaoController =
        TextEditingController(text: widget.todasTarefas.descricao);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text(
          'Editar Tarefa',
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
        const SizedBox(
          height: 10,
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
                var tarefaEditada = Tarefa(
                  titulo: tituloController.text,
                  descricao: descricaoController.text,
                  id: widget.todasTarefas.id,
                  isConcluida: false,
                  isFavorita: widget.todasTarefas.isFavorita,
                  data: DateTime.now().toString(),
                );
                context.read<TarefasBloc>().add(EditarTarefa(
                      todasTarefas: widget.todasTarefas,
                      novaTarefa: tarefaEditada,
                    ));
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

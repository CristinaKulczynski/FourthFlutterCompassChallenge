import 'package:flutter/material.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/services/gerador_de_numeros.dart';

class EditarATarefa extends StatelessWidget {
  final Tarefa todasTarefas;
  const EditarATarefa({Key? key, required this.todasTarefas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController tituloController =
        TextEditingController(text: todasTarefas.titulo);
    TextEditingController descricaoController =
        TextEditingController(text: todasTarefas.descricao);
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
              'Editar Tarefa',
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
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: TextField(
              autofocus: true,
              controller: descricaoController,
              decoration: const InputDecoration(
                label: Text('Descrição'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Apenas sai do ShowModalBottomSheet
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('cancelar'),
              ),
              // Cria variável tarefa, chama o tarefas_event para adicionar na lista
              ElevatedButton(
                onPressed: () {
                  var tarefaEditada = Tarefa(
                    titulo: tituloController.text,
                    descricao: descricaoController.text,
                    id: todasTarefas.id,
                    isConcluida: false,
                    isFavorita: todasTarefas.isFavorita,
                    data: DateTime.now().toString(),
                  );
                  // Metodo para criar adicionar tarefa
                  context.read<TarefasBloc>().add(EditarTarefa(
                        todasTarefas: todasTarefas, novaTarefa: tarefaEditada
                      ));
                  Navigator.pop(context);
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

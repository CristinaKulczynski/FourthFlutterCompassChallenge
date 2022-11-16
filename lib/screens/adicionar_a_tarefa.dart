import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/services/gerador_de_numeros.dart';

class AdicionarATarefa extends StatefulWidget {
  const AdicionarATarefa({
    Key? key,
  }) : super(key: key);

  @override
  State<AdicionarATarefa> createState() => _AdicionarATarefaState();
}

class _AdicionarATarefaState extends State<AdicionarATarefa> {
  @override
  Widget build(BuildContext context) {
    TextEditingController tituloController = TextEditingController();
    TextEditingController descricaoController = TextEditingController();
    TextEditingController dataFinalController = TextEditingController();
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
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: dataFinalController,
          decoration: const InputDecoration(
            icon: Icon(Icons.calendar_month_rounded),
            labelText: 'Selecione a Data',
            border: OutlineInputBorder(),
          ),
          onTap: () async {
            DateTime? pickeddate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2023));

            if (pickeddate != null) {
              setState(() {
                dataFinalController.text =
                    DateFormat("yyyy-MM-dd").format(pickeddate);
              });
            }
          },
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
                  id: GUIDGen.gerador(),
                  data: DateTime.now().toString(),
                  dataFinal: dataFinalController.text,
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

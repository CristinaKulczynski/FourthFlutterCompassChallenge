import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/widgets/lista_de_tarefas.dart';
import '../services/globals.dart' as globals;

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(
            fontSize: 64,
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Tarefa> suggestions = globals.listaTarefasGeralG.where((searchResult) {
      final result = searchResult.titulo.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return ListaDeTarefas(listaDeTarefas: suggestions);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/screens/adicionar_a_tarefa.dart';
import 'package:todolist/screens/completas.dart';
import 'package:todolist/screens/favoritos.dart';
import 'package:todolist/screens/menu_lateral.dart';
import 'package:todolist/screens/pendencias.dart';
import 'package:todolist/widgets/lista_de_tarefas.dart';
import 'globals.dart' as globals;

class TelaTODOList extends StatefulWidget {
  const TelaTODOList({super.key});
  static const id = 'tela_todo_list';

  @override
  State<TelaTODOList> createState() => _TelaTODOListState();
}

class _TelaTODOListState extends State<TelaTODOList> {
  final List<Map<String, dynamic>> _descricao = [
    {'Nome': const Pendencias(), 'titulo': 'Pendencias'},
    {'Nome': const Completas(), 'titulo': 'Completas'},
    {'Nome': const Favoritos(), 'titulo': 'Favoritas'},
  ];

  var _indexDaPagina = 0;

  void _adicionarTarefa(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const AdicionarATarefa(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            _descricao[_indexDaPagina]['titulo'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: CustomSearchDelegate()),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => _adicionarTarefa(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MenuLateral(),
      body: _descricao[_indexDaPagina]['Nome'],
      floatingActionButton: _indexDaPagina == 0
          ? FloatingActionButton(
              onPressed: () => _adicionarTarefa(context),
              tooltip: 'Adicione Tarefa',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexDaPagina,
        onTap: (index) {
          setState(() {
            _indexDaPagina = index;

            if (index == 0) {
              globals.listaTarefasGeralG = globals.listaTarefasPendentesG;
            } else if (index == 1) {
              globals.listaTarefasGeralG = globals.listaTarefasCompletasG;
            } else {
              globals.listaTarefasGeralG = globals.listaTarefasFavoritasG;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle_sharp),
            label: 'Pendente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritas',
          ),
        ],
      ),
    );
  }
}

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

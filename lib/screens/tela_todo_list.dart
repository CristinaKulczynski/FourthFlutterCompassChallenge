import 'package:flutter/material.dart';
import 'package:todolist/screens/adicionar_a_tarefa.dart';
import 'package:todolist/screens/completas.dart';
import 'package:todolist/screens/favoritos.dart';
import 'package:todolist/screens/menu_lateral.dart';
import 'package:todolist/screens/pendencias.dart';


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
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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

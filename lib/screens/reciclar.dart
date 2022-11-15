import 'package:flutter/material.dart';
import 'package:todolist/screens/menu_lateral.dart';
import 'package:todolist/widgets/lista_de_tarefas.dart';

class Reciclar extends StatelessWidget {
  const Reciclar({super.key});

  static const id = 'reciclar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Reciclar lixeira',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MenuLateral(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Chip(
              label: Text(
                // Mostra quantas tarefas temos
                ' Tasks',
              ),
            ),
          ),
          ListaDeTarefas(listaDeTarefas: []),
        ],
      ),
    );
  }
}

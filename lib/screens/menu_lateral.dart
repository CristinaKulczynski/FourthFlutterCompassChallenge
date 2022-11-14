import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

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
            const ListTile(
              leading: Icon(Icons.folder_special),
              title: Text('Minhas tarefas'),
              trailing: Text('0'),
            ),
            const ListTile(
              leading: Icon(Icons.folder_special),
              title: Text('Minhas tarefas'),
              trailing: Text('0'),
            ),
          ],
        ),
      ),
    );
  }
}

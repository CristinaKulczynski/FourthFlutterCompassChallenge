import 'package:flutter/material.dart';
import 'package:todolist/screens/Reciclar.dart';
import 'package:todolist/screens/tela_principal_todo_list.dart';

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
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                TelaTODOList.id,
              ),
              child: const ListTile(
                leading: Icon(Icons.folder_special),
                title: Text('Reciclar'),
                trailing: Text('0'),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                Reciclar.id,
              ),
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text('Lixeira'),
                trailing: Text('0'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

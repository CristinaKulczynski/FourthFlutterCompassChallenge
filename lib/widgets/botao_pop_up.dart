import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';

class BotaoPopUp extends StatelessWidget {
  final Tarefa tarefa;
  final VoidCallback cancelarOuDeletar;

  const BotaoPopUp(
      {Key? key, required this.cancelarOuDeletar, required this.tarefa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: tarefa.isDeletada == false
            ? ((context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.edit),
                      label: const Text('Editar'),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.bookmark),
                      label: const Text('Adicionar Favorito'),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Deletar'),
                    ),
                    onTap: () => cancelarOuDeletar,
                  ),
                ])
            : (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore),
                      label: const Text('Restaurar'),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Excluir permanentemente'),
                    ),
                    onTap: () {},
                  ),
                ]);
  }
}

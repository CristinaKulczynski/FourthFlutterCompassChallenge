import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';

class BotaoPopUp extends StatelessWidget {
  final Tarefa tarefa;
  final VoidCallback cancelarOuDeletar;
  final VoidCallback favoritaOuNao;
  final VoidCallback editar;
  final VoidCallback restaurar;

  const BotaoPopUp(
      {Key? key,
      required this.cancelarOuDeletar,
      required this.tarefa,
      required this.editar,
      required this.restaurar,
      required this.favoritaOuNao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: tarefa.isDeletada == false
            ? ((context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: editar,
                      icon: const Icon(Icons.edit),
                      label: const Text('Editar'),
                    ),
                    onTap: null,
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: tarefa.isFavorita == false
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark_remove),
                      label: tarefa.isFavorita == false
                          ? const Text('Adicionar Favorito')
                          : const Text('Remover do Favorito'),
                    ),
                    onTap: favoritaOuNao,
                  ),
                  PopupMenuItem(
                      child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Deletar'),
                      ),
                      onTap: cancelarOuDeletar),
                ])
            : (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore),
                      label: const Text('Restaurar'),
                    ),
                    onTap: restaurar,
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Excluir permanentemente'),
                    ),
                    onTap: cancelarOuDeletar,
                  ),
                ]);
  }
}

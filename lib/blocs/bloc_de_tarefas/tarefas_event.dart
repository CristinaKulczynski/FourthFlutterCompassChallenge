part of 'tarefas_bloc.dart';

// Classes responsáveis pelas ações adicionar, atualizar status e deletar tarefa.

abstract class TarefasEvent extends Equatable {
  const TarefasEvent();

  @override
  List<Object> get props => [];
}

class AdicionarTarefa extends TarefasEvent {
  final Tarefa tarefa;
  const AdicionarTarefa({
    required this.tarefa,
  });

  @override
  List<Object> get props => [tarefa];
}

class AtualizarTarefa extends TarefasEvent {
  final Tarefa tarefa;
  const AtualizarTarefa({
    required this.tarefa,
  });

  @override
  List<Object> get props => [tarefa];
}

class RemoveTarefa extends TarefasEvent {
  final Tarefa tarefa;
  const RemoveTarefa({
    required this.tarefa,
  });

  @override
  List<Object> get props => [tarefa];
}

class ExcluirTarefa extends TarefasEvent {
  final Tarefa tarefa;
  const ExcluirTarefa({
    required this.tarefa,
  });

  @override
  List<Object> get props => [tarefa];
}

class EditarTarefa extends TarefasEvent {
  final Tarefa todasTarefas;
  final Tarefa novaTarefa;
  const EditarTarefa({
    required this.todasTarefas,
    required this.novaTarefa,
  });

  @override
  List<Object> get props => [
        todasTarefas,
        novaTarefa,
      ];
}

class FavoritasOnOff extends TarefasEvent {
  final Tarefa tarefa;
  const FavoritasOnOff({required this.tarefa});

  @override
  List<Object> get props => [tarefa];
}

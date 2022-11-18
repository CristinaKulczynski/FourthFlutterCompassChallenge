part of 'tarefas_bloc.dart';

class TarefasState extends Equatable {
  final List<Tarefa> listaTarefasPendentes;
  final List<Tarefa> listaTarefasConcluidas;
  final List<Tarefa> listaTarefasFavoritas;
  final List<Tarefa> tarefasRemovidas;
  const TarefasState({
    this.listaTarefasPendentes = const <Tarefa>[],
    this.listaTarefasConcluidas = const <Tarefa>[],
    this.listaTarefasFavoritas = const <Tarefa>[],
    this.tarefasRemovidas = const <Tarefa>[],
  });

  @override
  List<Object> get props => [
        listaTarefasPendentes,
        listaTarefasConcluidas,
        listaTarefasFavoritas,
        tarefasRemovidas
      ];

  Map<String, dynamic> toMap() {
    return {
      'listaTarefasPendentes':
          listaTarefasPendentes.map((x) => x.toMap()).toList(),
      'listaTarefasConcluidas':
          listaTarefasConcluidas.map((x) => x.toMap()).toList(),
      'listaTarefasFavoritas':
          listaTarefasFavoritas.map((x) => x.toMap()).toList(),
      'tarefasRemovidas': tarefasRemovidas.map((x) => x.toMap()).toList(),
    };
  }

  factory TarefasState.fromMap(Map<String, dynamic> map) {
    return TarefasState(
      listaTarefasPendentes: List<Tarefa>.from(
          map['listaTarefasPendentes']?.map((x) => Tarefa.fromMap(x))),
      listaTarefasConcluidas: List<Tarefa>.from(
          map['listaTarefasConcluidas']?.map((x) => Tarefa.fromMap(x))),
      listaTarefasFavoritas: List<Tarefa>.from(
          map['listaTarefasFavoritas']?.map((x) => Tarefa.fromMap(x))),
      tarefasRemovidas: List<Tarefa>.from(
          map['tarefasRemovidas']?.map((x) => Tarefa.fromMap(x))),
    );
  }
}

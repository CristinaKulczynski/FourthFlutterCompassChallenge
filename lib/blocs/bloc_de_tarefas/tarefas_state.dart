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
        //listaDeTodasTarefas,
        listaTarefasConcluidas,
        listaTarefasFavoritas,
        listaTarefasPendentes,
        tarefasRemovidas
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listaTarefasPendentes':
          listaTarefasPendentes.map((x) => x.toMap()).toList(),
      'listaTarefasFavoritas':
          listaTarefasFavoritas.map((x) => x.toMap()).toList(),
      'listaTarefasConcluidas':
          listaTarefasConcluidas.map((x) => x.toMap()).toList(),
      //'listaDeTodasTarefas': listaDeTodasTarefas.map((x) => x.toMap()).toList(),
      'tarefasRemovidas': tarefasRemovidas.map((x) => x.toMap()).toList(),
    };
  }

  factory TarefasState.fromMap(Map<String, dynamic> map) {
    return TarefasState(
      // listaDeTodasTarefas: List<Tarefa>.from(
      //   (map['listaDeTodasTarefas'] as List<int>).map<Tarefa>(
      //     (x) => Tarefa.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
      listaTarefasPendentes: List<Tarefa>.from(
          map['listaTarefasPendentes']?.map((x) => Tarefa.fromMap(x))),
      listaTarefasFavoritas: List<Tarefa>.from(
          map['listaTarefaFavoritas']?.map((x) => Tarefa.fromMap(x))),
      listaTarefasConcluidas: List<Tarefa>.from(
          map['listaTarefasConcluidos']?.map((x) => Tarefa.fromMap(x))),
      tarefasRemovidas: List<Tarefa>.from(
          map['listaTarefasPendentes']?.map((x) => Tarefa.fromMap(x))),
    );
  }
}

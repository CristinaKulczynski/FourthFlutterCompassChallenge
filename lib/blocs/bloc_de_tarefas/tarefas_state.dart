part of 'tarefas_bloc.dart';

class TarefasState extends Equatable {
  // final List<Tarefa> listaDeTodasTarefas;
  final List<Tarefa> listaTarefasPendentes;
  final List<Tarefa> listaTarefasConcluidas;
  final List<Tarefa> listaTarefasFavoritas;
  final List<Tarefa> tarefasRemovidas;

  const TarefasState({
    //  this.listaDeTodasTarefas = const <Tarefa>[],
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
        (map['listaTarefasPendentes'] as List<int>).map<Tarefa>(
          (x) => Tarefa.fromMap(x as Map<String, dynamic>),
        ),
      ),
      listaTarefasFavoritas: List<Tarefa>.from(
        (map['listaTarefasFavoritas'] as List<int>).map<Tarefa>(
          (x) => Tarefa.fromMap(x as Map<String, dynamic>),
        ),
      ),
      listaTarefasConcluidas: List<Tarefa>.from(
        (map['listaTarefasConcluidas'] as List<int>).map<Tarefa>(
          (x) => Tarefa.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tarefasRemovidas: List<Tarefa>.from(
        (map['tarefasRemovidas'] as List<int>).map<Tarefa>(
          (x) => Tarefa.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

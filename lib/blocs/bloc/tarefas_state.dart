part of 'tarefas_bloc.dart';

class TarefasState extends Equatable {
  final List<Tarefa> listaDeTodasTarefas;

  const TarefasState({this.listaDeTodasTarefas = const <Tarefa>[]});

  @override
  List<Object> get props => [listaDeTodasTarefas];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listaDeTodasTarefas': listaDeTodasTarefas.map((x) => x.toMap()).toList(),
    };
  }

  factory TarefasState.fromMap(Map<String, dynamic> map) {
    return TarefasState(
      listaDeTodasTarefas: List<Tarefa>.from(
        (map['listaDeTodasTarefas'] as List<int>).map<Tarefa>(
          (x) => Tarefa.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

part of 'tarefas_bloc.dart';

class TarefasState extends Equatable {
  final List<Tarefa> listaDeTodasTarefas;

  const TarefasState({this.listaDeTodasTarefas = const <Tarefa>[]});

  @override
  List<Object> get props => [listaDeTodasTarefas];
}

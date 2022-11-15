import 'package:equatable/equatable.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/models/tarefa.dart';

part 'tarefas_event.dart';
part 'tarefas_state.dart';

// Tarefas bloc serve para controlar os eventos e emitir um novo estado da tarefa

class TarefasBloc extends HydratedBloc<TarefasEvent, TarefasState> {
  TarefasBloc() : super(const TarefasState()) {
    // Lógica para fazer as ações
    on<AdicionarTarefa>(_onAdicionarTarefa);
    on<AtualizarTarefa>(_onAtualizarTarefa);
    on<ExcluirTarefa>(_onExcluirTarefa);
    on<RemoveTarefa>(_onRemoveTarefa);
  }

  // Recebe o evento e o emissor atuais
  void _onAdicionarTarefa(AdicionarTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    emit(TarefasState(
        listaDeTodasTarefas: List.from(state.listaDeTodasTarefas)
          ..add(event.tarefa),
        // O estado das tarefas removidas deve ser mostrado
        // Para que quando uma tarefa for adicionada
        // A lista de tarefas removidas não seja apagada
        tarefasRemovidas: state.tarefasRemovidas));
  }

  void _onAtualizarTarefa(AtualizarTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    final tarefa = event.tarefa;
    // variável para atualizar a tarefa no lugar certo
    final int index = state.listaDeTodasTarefas.indexOf(tarefa);

    // Criando nova lista e removendo tarefa antiga

    List<Tarefa> listaDeTodasTarefas = List.from(state.listaDeTodasTarefas)
      ..remove(tarefa);
    //Se o valor da tarefa for falso, adiciona como verdadeiro e vice-versa
    tarefa.isConcluida == false
        ? listaDeTodasTarefas.insert(index, tarefa.copyWith(isConcluida: true))
        : listaDeTodasTarefas.insert(
            index, tarefa.copyWith(isConcluida: false));
    //Emitindo nova tarefa
    emit(TarefasState(
      listaDeTodasTarefas: listaDeTodasTarefas,
      tarefasRemovidas: state.tarefasRemovidas,
    ));
  }

  void _onRemoveTarefa(RemoveTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    emit(TarefasState(
      listaDeTodasTarefas: List.from(state.listaDeTodasTarefas)
        ..remove(event.tarefa),
      tarefasRemovidas: List.from(state.tarefasRemovidas)
        ..add(event.tarefa.copyWith(isDeletada: true)),
    ));
  }

  void _onExcluirTarefa(ExcluirTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    emit(TarefasState(
        listaDeTodasTarefas: state.listaDeTodasTarefas,
        tarefasRemovidas: List.from(state.tarefasRemovidas)
          ..remove(event.tarefa)));
  }

  @override
  TarefasState? fromJson(Map<String, dynamic> json) {
    return TarefasState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TarefasState state) {
    return state.toMap();
  }
}

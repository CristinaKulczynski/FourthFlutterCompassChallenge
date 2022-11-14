import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/models/tarefa.dart';

part 'tarefas_event.dart';
part 'tarefas_state.dart';

// Tarefas bloc serve para controlar os eventos e emitir um novo estado da tarefa

class TarefasBloc extends Bloc<TarefasEvent, TarefasState> {
  TarefasBloc() : super(const TarefasState()) {
    // Lógica para fazer as ações
    on<AdicionarTarefa>(_onAdicionarTarefa);
    on<AtualizarTarefa>(_onAtualizarTarefa);
    on<ExcluirTarefa>(_onExcluirTarefa);
  }

  // Recebe o evento e o emissor atuais
  void _onAdicionarTarefa(AdicionarTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    emit(TarefasState(
      listaDeTodasTarefas: List.from(state.listaDeTodasTarefas)
        ..add(event.tarefa),
    ));
  }

  void _onAtualizarTarefa(AtualizarTarefa event, Emitter<TarefasState> emit) {}

  void _onExcluirTarefa(ExcluirTarefa event, Emitter<TarefasState> emit) {}
}

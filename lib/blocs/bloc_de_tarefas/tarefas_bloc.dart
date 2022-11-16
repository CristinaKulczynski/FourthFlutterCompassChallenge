import 'package:equatable/equatable.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/models/tarefa.dart';
part 'tarefas_event.dart';
part 'tarefas_state.dart';

class TarefasBloc extends HydratedBloc<TarefasEvent, TarefasState> {
  TarefasBloc() : super(const TarefasState()) {
    on<AdicionarTarefa>(_onAdicionarTarefa);
    on<AtualizarTarefa>(_onAtualizarTarefa);
    on<ExcluirTarefa>(_onExcluirTarefa);
    on<RemoveTarefa>(_onRemoveTarefa);
    on<FavoritasOnOff>(_onFavoritasOnOff);
    on<EditarTarefa>(_onEditarTarefa);
    on<RestaurarTarefa>(_onRestaurarTarefa);
    on<ExcluiTodasTarefas>(_onExcluiTodasTarefas);
  }

  void _onAdicionarTarefa(AdicionarTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    emit(TarefasState(
        listaTarefasPendentes: List.from(state.listaTarefasPendentes)
          ..add(event.tarefa),
        listaTarefasConcluidas: state.listaTarefasConcluidas,
        listaTarefasFavoritas: state.listaTarefasFavoritas,
        tarefasRemovidas: state.tarefasRemovidas));
  }

  void _onAtualizarTarefa(AtualizarTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    final tarefa = event.tarefa;

    List<Tarefa> listaTarefasPendentes = state.listaTarefasPendentes;
    List<Tarefa> listaTarefasConcluidas = state.listaTarefasConcluidas;
    List<Tarefa> listaTarefasFavoritas = state.listaTarefasFavoritas;

    if (tarefa.isConcluida == false) {
      if (tarefa.isFavorita == false) {
        listaTarefasPendentes = List.from(listaTarefasPendentes)
          ..remove(tarefa);
        listaTarefasConcluidas.insert(0, tarefa.copyWith(isConcluida: true));
      } else {
        var tarefaIndex = listaTarefasFavoritas.indexOf(tarefa);
        listaTarefasPendentes = List.from(listaTarefasPendentes)
          ..remove(tarefa);
        listaTarefasConcluidas.insert(0, tarefa.copyWith(isConcluida: true));
        listaTarefasFavoritas = List.from(listaTarefasFavoritas)
          ..remove(tarefa)
          ..insert(tarefaIndex, tarefa.copyWith(isConcluida: true));
      }
    } else {
      if (tarefa.isFavorita == false) {
        listaTarefasConcluidas = List.from(listaTarefasConcluidas)
          ..remove(tarefa);
        listaTarefasPendentes = List.from(listaTarefasPendentes)
          ..insert(0, tarefa.copyWith(isConcluida: false));
      } else {
        var tarefaIndex = listaTarefasFavoritas.indexOf(tarefa);
        listaTarefasConcluidas = List.from(listaTarefasConcluidas)
          ..remove(tarefa);
        listaTarefasPendentes = List.from(listaTarefasPendentes)
          ..insert(0, tarefa.copyWith(isConcluida: false));
        listaTarefasFavoritas = List.from(listaTarefasFavoritas)
          ..remove(tarefa)
          ..insert(tarefaIndex, tarefa.copyWith(isConcluida: false));
      }
    }
    emit(TarefasState(
      listaTarefasPendentes: listaTarefasPendentes,
      listaTarefasConcluidas: listaTarefasConcluidas,
      listaTarefasFavoritas: listaTarefasFavoritas,
      tarefasRemovidas: state.tarefasRemovidas,
    ));
  }

  void _onExcluirTarefa(ExcluirTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    emit(TarefasState(
        listaTarefasPendentes: state.listaTarefasPendentes,
        listaTarefasConcluidas: state.listaTarefasConcluidas,
        listaTarefasFavoritas: state.listaTarefasFavoritas,
        tarefasRemovidas: List.from(state.tarefasRemovidas)
          ..remove(event.tarefa)));
  }

  void _onRemoveTarefa(RemoveTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    emit(TarefasState(
        listaTarefasPendentes: List.from(state.listaTarefasPendentes)
          ..remove(event.tarefa),
        listaTarefasConcluidas: List.from(state.listaTarefasConcluidas)
          ..remove(event.tarefa),
        listaTarefasFavoritas: List.from(state.listaTarefasFavoritas)
          ..remove(event.tarefa),
        tarefasRemovidas: List.from(state.tarefasRemovidas)
          ..add(event.tarefa.copyWith(isDeletada: true))));
  }

  void _onFavoritasOnOff(FavoritasOnOff event, Emitter<TarefasState> emit) {
    final state = this.state;
    List<Tarefa> listaTarefasPendentes = state.listaTarefasPendentes;
    List<Tarefa> listaTarefasConcluidas = state.listaTarefasConcluidas;
    List<Tarefa> listaTarefasFavoritas = state.listaTarefasFavoritas;
    if (event.tarefa.isConcluida == false) {
      if (event.tarefa.isFavorita == false) {
        var tarefaIndex = listaTarefasPendentes.indexOf(event.tarefa);
        listaTarefasPendentes = List.from(listaTarefasPendentes)
          ..remove(event.tarefa)
          ..insert(tarefaIndex, event.tarefa.copyWith(isFavorita: true));
        listaTarefasFavoritas.insert(
            0, event.tarefa.copyWith(isFavorita: true));
      } else {
        var tarefaIndex = listaTarefasPendentes.indexOf(event.tarefa);
        listaTarefasPendentes = List.from(listaTarefasPendentes)
          ..remove(event.tarefa)
          ..insert(tarefaIndex, event.tarefa.copyWith(isFavorita: false));
        listaTarefasFavoritas.remove(event.tarefa);
      }
    } else {
      if (event.tarefa.isFavorita == false) {
        var tarefaIndex = listaTarefasConcluidas.indexOf(event.tarefa);
        listaTarefasConcluidas = List.from(listaTarefasConcluidas)
          ..remove(event.tarefa)
          ..insert(tarefaIndex, event.tarefa.copyWith(isFavorita: true));
        listaTarefasFavoritas.insert(
            0, event.tarefa.copyWith(isFavorita: true));
      } else {
        var tarefaIndex = listaTarefasConcluidas.indexOf(event.tarefa);
        listaTarefasConcluidas = List.from(listaTarefasConcluidas)
          ..remove(event.tarefa)
          ..insert(tarefaIndex, event.tarefa.copyWith(isFavorita: false));
        listaTarefasFavoritas.remove(event.tarefa);
      }
    }
    emit(TarefasState(
      listaTarefasPendentes: listaTarefasPendentes,
      listaTarefasConcluidas: listaTarefasConcluidas,
      listaTarefasFavoritas: listaTarefasFavoritas,
      tarefasRemovidas: state.tarefasRemovidas,
    ));
  }

  void _onEditarTarefa(EditarTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    List<Tarefa> listaTarefasFavoritas = state.listaTarefasFavoritas;
    if (event.todasTarefas.isFavorita == true) {
      listaTarefasFavoritas
        ..remove(event.todasTarefas)
        ..insert(0, event.novaTarefa);
    }
    emit(TarefasState(
        listaTarefasPendentes: List.from(state.listaTarefasPendentes)
          ..remove(event.todasTarefas)
          ..insert(0, event.novaTarefa),
        listaTarefasConcluidas: state.listaTarefasConcluidas
          ..remove(event.todasTarefas),
        listaTarefasFavoritas: listaTarefasFavoritas,
        tarefasRemovidas: state.tarefasRemovidas));
  }

  void _onRestaurarTarefa(RestaurarTarefa event, Emitter<TarefasState> emit) {
    final state = this.state;
    emit(TarefasState(
        tarefasRemovidas: List.from(state.tarefasRemovidas)
          ..remove(event.tarefa),
        listaTarefasPendentes: List.from(state.listaTarefasPendentes)
          ..insert(
              0,
              event.tarefa.copyWith(
                  isDeletada: false, isConcluida: false, isFavorita: false)),
        listaTarefasConcluidas: state.listaTarefasConcluidas,
        listaTarefasFavoritas: state.listaTarefasFavoritas));
  }

  void _onExcluiTodasTarefas(
      ExcluiTodasTarefas event, Emitter<TarefasState> emit) {
    final state = this.state;
    emit(
      TarefasState(
        tarefasRemovidas: List.from(state.tarefasRemovidas)..clear(),
        listaTarefasPendentes: state.listaTarefasPendentes,
        listaTarefasConcluidas: state.listaTarefasConcluidas,
        listaTarefasFavoritas: state.listaTarefasFavoritas,
      ),
    );
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

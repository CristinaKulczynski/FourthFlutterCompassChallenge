import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'botao_event.dart';
part 'botao_state.dart';

class BotaoBloc extends HydratedBloc<BotaoEvent, BotaoState> {
  BotaoBloc() : super(const BotaoInitial(botaoValor: false)) {
    on<BotaoAtivadoEvent>((event, emit) {
      emit(
        const BotaoState(botaoValor: true),
      );
    });
    on<BotaoDesativadoEvent>((event, emit) {
      emit(
        const BotaoState(botaoValor: false),
      );
    });
  }

  @override
  BotaoState? fromJson(Map<String, dynamic> json) {
    return BotaoState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(BotaoState state) {
    return state.toMap();
  }
}

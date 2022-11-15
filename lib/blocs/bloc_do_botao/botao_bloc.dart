import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'botao_event.dart';
part 'botao_state.dart';

class BotaoBloc extends Bloc<BotaoEvent, BotaoState> {
  BotaoBloc() : super(const BotaoInitial(botaoValor: false)) {
    on<BotaoEvent>((event, emit) {
      emit(
        const BotaoState(botaoValor: true),
      );
    });
    on<BotaoEvent>((event, emit) {
      emit(
        const BotaoState(botaoValor: false),
      );
    });
  }
}

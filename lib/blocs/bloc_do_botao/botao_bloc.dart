import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'botao_event.dart';
part 'botao_state.dart';

class BotaoBloc extends Bloc<BotaoEvent, BotaoState> {
  BotaoBloc() : super(BotaoInitial()) {
    on<BotaoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tema_botao_event.dart';
part 'tema_botao_state.dart';

class TemaBotaoBloc extends Bloc<TemaBotaoEvent, TemaBotaoState> {
  TemaBotaoBloc() : super(TemaBotaoInitial()) {
    on<TemaBotaoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

part of 'botao_bloc.dart';

abstract class BotaoEvent extends Equatable {
  const BotaoEvent();

  @override
  List<Object> get props => [];
}

class BotaoAtivadoEvent extends BotaoEvent {}

class BotaoDesativadoEvent extends BotaoEvent {}

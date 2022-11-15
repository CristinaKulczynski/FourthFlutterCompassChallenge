part of 'botao_bloc.dart';

abstract class BotaoState extends Equatable {
  const BotaoState();
  
  @override
  List<Object> get props => [];
}

class BotaoInitial extends BotaoState {}

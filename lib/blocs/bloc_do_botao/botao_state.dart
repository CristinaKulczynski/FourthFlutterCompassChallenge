part of 'botao_bloc.dart';

class BotaoState extends Equatable {
  final bool botaoValor;

  const BotaoState({required this.botaoValor});

  @override
  List<Object> get props => [botaoValor];
}

class BotaoInitial extends BotaoState {
  const BotaoInitial({required super.botaoValor});
}

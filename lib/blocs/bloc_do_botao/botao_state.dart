part of 'botao_bloc.dart';

class BotaoState extends Equatable {
  final bool botaoValor;

  const BotaoState({required this.botaoValor});

  @override
  List<Object> get props => [botaoValor];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'botaoValor': botaoValor,
    };
  }

  factory BotaoState.fromMap(Map<String, dynamic> map) {
    return BotaoState(
      botaoValor: map['botaoValor'] ?? false,
    );
  }
}

class BotaoInitial extends BotaoState {
  const BotaoInitial({required bool botaoValor})
      : super(botaoValor: botaoValor);
}

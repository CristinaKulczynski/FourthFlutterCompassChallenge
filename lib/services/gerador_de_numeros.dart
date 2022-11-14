import 'dart:math' as math;

String geradorId() {
  String uid = 1.toString();
  // Gerando números aleatórios para o id
  String aleatorio = uid.toString() +
      math.Random().nextInt(9999).toString() +
      math.Random().nextInt(9999).toString() +
      math.Random().nextInt(9999).toString();
  return aleatorio;
}

import 'package:equatable/equatable.dart';

class Tarefas extends Equatable {
  final String titulo;
  bool? isConcluida;
  bool? isDeletada;

  Tarefas({
    required this.titulo,
    this.isConcluida,
    this.isDeletada,
  }) {
    // inicializar booleanos
    isConcluida = isConcluida ?? false;
    isDeletada = isDeletada ?? false;
  }

  Tarefas copyWith({
    String? titulo,
    bool? isConcluida,
    bool? isDeletada,
  }) {
    return Tarefas(
      titulo: titulo ?? this.titulo,
      isConcluida: isConcluida ?? this.isConcluida,
      isDeletada: isDeletada ?? this.isDeletada,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'isConcluida': isConcluida,
      'isDeletada': isDeletada,
    };
  }

  factory Tarefas.fromMap(Map<String, dynamic> map) {
    return Tarefas(
      titulo: map['titulo'] as String,
      isConcluida:
          map['isConcluida'] != null ? map['isConcluida'] as bool : null,
      isDeletada: map['isDeletada'] != null ? map['isDeletada'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        titulo,
        isConcluida,
        isDeletada,
      ];
}

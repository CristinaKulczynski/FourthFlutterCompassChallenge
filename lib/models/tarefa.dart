import 'package:equatable/equatable.dart';

class Tarefa extends Equatable {
  final String titulo;
  bool? isConcluida;
  bool? isDeletada;

  Tarefa({
    required this.titulo,
    this.isConcluida,
    this.isDeletada,
  }) {
    // inicializar booleanos
    isConcluida = isConcluida ?? false;
    isDeletada = isDeletada ?? false;
  }

  Tarefa copyWith({
    String? titulo,
    bool? isConcluida,
    bool? isDeletada,
  }) {
    return Tarefa(
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

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
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

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Tarefa extends Equatable {
  final String titulo;
  final String id;
  bool? isConcluida;
  bool? isDeletada;

  Tarefa({
    required this.titulo,
    required this.id,
    this.isConcluida,
    this.isDeletada,
  }) {
    // inicializar booleanos
    isConcluida = isConcluida ?? false;
    isDeletada = isDeletada ?? false;
  }

  Tarefa copyWith({
    String? titulo,
    String? id,
    bool? isConcluida,
    bool? isDeletada,
  }) {
    return Tarefa(
      titulo: titulo ?? this.titulo,
      id: id ?? this.id,
      isConcluida: isConcluida ?? this.isConcluida,
      isDeletada: isDeletada ?? this.isDeletada,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'id': id,
      'isConcluida': isConcluida,
      'isDeletada': isDeletada,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      titulo: map['titulo'] as String,
      id: map['id'] as String,
      isConcluida:
          map['isConcluida'] != null ? map['isConcluida'] as bool : null,
      isDeletada: map['isDeletada'] != null ? map['isDeletada'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        titulo,
        id,
        isConcluida,
        isDeletada,
      ];
}

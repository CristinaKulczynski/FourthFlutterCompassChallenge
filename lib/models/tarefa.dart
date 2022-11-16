import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Tarefa extends Equatable {
  final String titulo;
  final String descricao;
  final String id;
  final String data;
  bool? isFavorita;
  bool? isConcluida;
  bool? isDeletada;

  Tarefa({
    required this.titulo,
    required this.descricao,
    required this.id,
    required this.data,
    this.isFavorita,
    this.isConcluida,
    this.isDeletada,
  }) {
    isFavorita = isFavorita ?? false;
    isConcluida = isConcluida ?? false;
    isDeletada = isDeletada ?? false;
  }

  Tarefa copyWith({
    String? titulo,
    String? descricao,
    String? id,
    String? data,
    bool? isFavorita,
    bool? isConcluida,
    bool? isDeletada,
  }) {
    return Tarefa(
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      id: id ?? this.id,
      data: data ?? this.data,
      isFavorita: isFavorita ?? this.isFavorita,
      isConcluida: isConcluida ?? this.isConcluida,
      isDeletada: isDeletada ?? this.isDeletada,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'descricao': descricao,
      'id': id,
      'data': data,
      'is': isFavorita,
      'isConcluida': isConcluida,
      'isDeletada': isDeletada,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String,
      id: map['id'] as String,
      data: map['data'] as String,
      isFavorita: map['isFavorita'] != null ? map['isFavorita'] as bool : null,
      isConcluida:
          map['isConcluida'] != null ? map['isConcluida'] as bool : null,
      isDeletada: map['isDeletada'] != null ? map['isDeletada'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        titulo,
        descricao,
        id,
        data,
        isFavorita,
        isConcluida,
        isDeletada,
      ];
}

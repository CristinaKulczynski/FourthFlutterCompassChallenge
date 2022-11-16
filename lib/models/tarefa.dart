import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Tarefa extends Equatable {
  final String titulo;
  final String descricao;
  final String id;
  final String data;
  final String dataFinal;
  bool? isConcluida;
  bool? isFavorita;
  bool? isDeletada;

  Tarefa({
    required this.titulo,
    required this.descricao,
    required this.id,
    required this.data,
    required this.dataFinal,
    this.isConcluida,
    this.isFavorita,
    this.isDeletada,
  }) {
    isConcluida = isConcluida ?? false;
    isFavorita = isFavorita ?? false;
    isDeletada = isDeletada ?? false;
  }

  Tarefa copyWith({
    String? titulo,
    String? descricao,
    String? id,
    String? data,
    String? dataFinal,
    bool? isConcluida,
    bool? isDeletada,
    bool? isFavorita,
  }) {
    return Tarefa(
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      id: id ?? this.id,
      data: data ?? this.data,
      dataFinal: dataFinal ?? this.dataFinal,
      isConcluida: isConcluida ?? this.isConcluida,
      isDeletada: isDeletada ?? this.isDeletada,
      isFavorita: isFavorita ?? this.isFavorita,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'descricao': descricao,
      'id': id,
      'data': data,
      'dataFinal': dataFinal,
      'isConcluida': isConcluida,
      'isDeletada': isDeletada,
      'is': isFavorita,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      titulo: map['titulo'] ?? '',
      descricao: map['descricao'] ?? '',
      id: map['id'] ?? '',
      data: map['data'] ?? '',
      dataFinal: map['dataFinal'] ?? '',
      isConcluida: map['isConcluida'],
      isDeletada: map['isDeletada'],
      isFavorita: map['isFavorita'],
    );
  }

  @override
  List<Object?> get props => [
        titulo,
        descricao,
        id,
        data,
        dataFinal,
        isConcluida,
        isDeletada,
        isFavorita,
      ];
}

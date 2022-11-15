import 'package:flutter/material.dart';

enum Tema {
  lightTema,
  darkTema,
}

class Temas {
  static final temasAplicativo = {
    Tema.darkTema: ThemeData(
      primaryColor: const Color.fromARGB(255, 27, 27, 27),
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 100, 33, 33),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.white)),
    ),
  };
}

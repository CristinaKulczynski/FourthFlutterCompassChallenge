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
    Tema.lightTema: ThemeData(
      primaryColor: const Color.fromARGB(255, 255, 255, 255),
      backgroundColor: const Color.fromARGB(255, 206, 206, 206),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 100, 33, 33),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 2, 2, 2)),
        ),
      ),
      textTheme: const TextTheme(
          subtitle1: TextStyle(color: Color.fromARGB(255, 7, 7, 7))),
    ),
  };
}

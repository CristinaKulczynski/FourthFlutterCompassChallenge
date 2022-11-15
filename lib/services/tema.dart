import 'package:flutter/material.dart';

enum Tema {
  lightTema,
  darkTema,
}

class Temas {
  static final temasAplicativo = {
    Tema.darkTema: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      primarySwatch: Colors.grey,
      backgroundColor: const Color(
        0xFF212121,
      ),
      dividerColor: Colors.black45,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.white,
      ),
    ),
    Tema.lightTema: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      primarySwatch: Colors.grey,
      backgroundColor: const Color(
        0xFF212121,
      ),
      dividerColor: Colors.black45,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.white,
      ),
    ),
  };
}

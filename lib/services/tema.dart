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
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black45,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.pink),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white))),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey, unselectedItemColor: Colors.white),
    ),

    /*-----------------------------------------------------------------*/
    //                            TEMA CLARO                           //
    /*-----------------------------------------------------------------*/

    Tema.lightTema: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      primarySwatch: Colors.grey,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black, foregroundColor: Colors.white),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black))),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white),
    ),
  };
}

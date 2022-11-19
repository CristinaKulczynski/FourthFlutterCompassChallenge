import 'package:flutter/material.dart';
import 'package:todolist/screens/Reciclar.dart';
// import 'package:todolist/screens/pesquisa.dart';
import 'package:todolist/screens/tela_todo_list.dart';

class RotasDoAplicativo {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Reciclar.id:
        return MaterialPageRoute(builder: (_) => const Reciclar());
      // case Pesquisa.id:
      //   return MaterialPageRoute(builder: (_) => Pesquisa());
      case TelaTODOList.id:
        return MaterialPageRoute(builder: (_) => const TelaTODOList());
      default:
        return null;
    }
  }
}

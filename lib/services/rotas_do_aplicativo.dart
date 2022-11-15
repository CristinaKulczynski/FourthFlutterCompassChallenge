import 'package:flutter/material.dart';
import 'package:todolist/screens/Reciclar.dart';
import 'package:todolist/screens/tela_todo_list.dart';

class RotasDoAplicativo {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Reciclar.id:
        return MaterialPageRoute(builder: (_) => const Reciclar());
      case TelaTODOList.id:
        return MaterialPageRoute(builder: (_) => TelaTODOList());
      default:
        return null;
    }
  }
}

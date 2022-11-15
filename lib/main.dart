import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/screens/tela_principal_todo_list.dart';
import 'package:todolist/services/rotas_do_aplicativo.dart';

void main() async {
  //Inicializando ligações dos widgets
  WidgetsFlutterBinding.ensureInitialized();

  //Armazenando os dados do app utilizando a extensão do bloc - HydratedBloc.
  final armazenamento = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(
      MyApp(
        rotasDoAplicativo: RotasDoAplicativo(),
      ),
    ),
    storage: armazenamento,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.rotasDoAplicativo}) : super(key: key);

  final RotasDoAplicativo rotasDoAplicativo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TarefasBloc(),
      child: const MaterialApp(
        title: 'TODO List',
        debugShowCheckedModeBanner: false,
        /*Tirar debug da tela*/
        home: TelaTODOList(),
        onGenerateRoute: rotasDoAplicativo.onGenerateRoute,
      ),
    );
  }
}

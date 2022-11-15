import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todolist/blocs/exportacao_do_bloc.dart';
import 'package:todolist/screens/principal_todo_list.dart';
import 'package:todolist/screens/pendencias.dart';
import 'package:todolist/services/rotas_do_aplicativo.dart';
import 'package:todolist/services/tema.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TarefasBloc()),
        BlocProvider(create: (context) => BotaoBloc())
      ],
      child: BlocBuilder<BotaoBloc, BotaoState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'TODO List',
            debugShowCheckedModeBanner: false,
            // Muda as cores do tema de acordo com o estado do botao switch
            theme: state.botaoValor
                ? Temas.temasAplicativo[Tema.lightTema]
                : Temas.temasAplicativo[Tema.darkTema],
            /*Tirar debug da tela*/
            home: const TelaTODOList(),
            onGenerateRoute: rotasDoAplicativo.onGenerateRoute,
          );
        },
      ),
    );
  }
}

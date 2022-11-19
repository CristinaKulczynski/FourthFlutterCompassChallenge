// import 'package:flutter/material.dart';
// import 'package:todolist/blocs/exportacao_do_bloc.dart';
// import 'package:todolist/models/tarefa.dart';
// import 'package:todolist/screens/menu_lateral.dart';
// import 'package:todolist/widgets/lista_de_tarefas.dart';

// class Pesquisa extends StatelessWidget {
//    Pesquisa({super.key});
//   static const id = 'pesquisa';

//   TextEditingController tituloPesquisaControler = TextEditingController();
//   // ValueNotifier<List<Tarefa>> listaPesquisa = ValueNotifier<List<Tarefa>>([]);

//   // _pesquisaTitulo() {
//   //   listaPesquisa.value
//   //       .where((element) => element.titulo
//   //           .toLowerCase()
//   //           .contains(tituloPesquisaControler.text.toLowerCase()))
//   //       .toList();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TarefasBloc, TarefasState>(
//       builder: (context, state) {
//         List<Tarefa> listaDeTarefas = state.listaTarefasPendentes;
//         return Scaffold(
//           appBar: AppBar(
//             title: const Padding(
//               padding: EdgeInsets.only(left: 15),
//               child: Text(
//                 'Pesquisa',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           drawer: const MenuLateral(),
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: TextFormField(
//                     onChanged: (value) {
//                       //_pesquisaTitulo();
//                     },
//                     onFieldSubmitted: (value) {},
//                     controller: tituloPesquisaControler,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       prefixIcon: Padding(
//                           padding: EdgeInsetsDirectional.only(start: 12.0),
//                           child: Icon(Icons.search)),
//                       hintStyle: TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               // SizedBox(
//               //   height: 100,
//               //   width: 100,
//               //   child: ValueListenableBuilder(
//               //     valueListenable: listaPesquisa,
//               //     builder: (context, value, child) => listaPesquisa
//               //             .value.isNotEmpty
//               //         ? ListaDeTarefas(listaDeTarefas: listaPesquisa.value)
//               //         : const Text('Está vazio meu cumpicha'),
//               //   ),
//               // )
//               ListaDeTarefas(listaDeTarefas: listaDeTarefas),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

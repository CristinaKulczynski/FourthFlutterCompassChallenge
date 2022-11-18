import 'package:flutter/material.dart';
import '../blocs/exportacao_do_bloc.dart';

class Pesquisa extends StatelessWidget {
  const Pesquisa({Key? key}) : super(key: key);
  static const id = 'tela_todo_list';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TarefasBloc, TarefasState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(start: 12.0),
                        child: Icon(Icons.search)),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(194, 189, 189, 0.7),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

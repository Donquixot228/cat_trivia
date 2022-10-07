import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatImage extends StatelessWidget {
  const CatImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          flex: 2,
          child: state.catModel.url != ''
              ? Image.network(
                  state.catModel.url,
                  fit: BoxFit.fitHeight,
                )
              : Container(),
        );
      },
    );
  }
}

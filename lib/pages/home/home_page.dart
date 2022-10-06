import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:cat_trivia/repositories/database_repository.dart';
import 'package:cat_trivia/resources/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Image.network(state.imageUrl),
                Spacer(),
                IconButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(GetFact());
                  },
                  icon: SvgPicture.asset(
                    AppIcons.search,
                  ),
                ),
                Spacer(),
                Text(state.factModel.fact),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

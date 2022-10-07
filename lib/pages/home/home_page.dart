import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:cat_trivia/pages/home/widgets/another_button.dart';
import 'package:cat_trivia/pages/home/widgets/cat_fact.dart';
import 'package:cat_trivia/pages/home/widgets/cat_image.dart';
import 'package:cat_trivia/widgets/custom_loader_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/';

  static Widget create() {
    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.homeStatus == HomeStatus.loading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: CustomLoaderOverlay(
        child: Center(
          child: Column(
            children: const [
              CatImage(),
              CatFact(),
              AnotherCatButton(),
            ],
          ),
        ),
      ),
    );
  }
}

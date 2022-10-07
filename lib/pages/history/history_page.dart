import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:cat_trivia/pages/history/view/history_empty_view.dart';
import 'package:cat_trivia/pages/history/view/history_view.dart';
import 'package:cat_trivia/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  static const String routeName = '/history';

  static Widget create() {
    return const HistoryPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.backgroundGradient,
        ),
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.historyList.isEmpty) {
            return const EmptyView();
          } else {
            return const HistoryView();
          }
        },
      ),
    );
  }
}

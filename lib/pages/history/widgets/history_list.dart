
import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_typography.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 15),
          itemCount: state.historyList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListTile(
                title: Text(
                  state.historyList[index].time,
                  style: AppTypography.labelBold.copyWith(
                      color: Colors.white.withOpacity(0.6), fontSize: 14),
                ),
                subtitle: Text(
                  state.historyList[index].text,
                  style: AppTypography.bodyBold
                      .copyWith(color: Colors.white, fontSize: 15),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
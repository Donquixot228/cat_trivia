import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:cat_trivia/resources/app_colors.dart';
import 'package:cat_trivia/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFact extends StatelessWidget {
  const CatFact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                state.factModel.fact,
                textAlign: TextAlign.center,
                style: AppTypography.bodyBold.copyWith(
                  color: AppColors.primary2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

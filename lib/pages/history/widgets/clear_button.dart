import 'dart:developer';

import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:cat_trivia/widgets/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_typography.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            log('Clear history ${state.historyList.length}');
            context.read<HomeBloc>().add(ClearHistory());
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Align(
              alignment: Alignment.topRight,
              child: BlurContainer(
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 4),
                        child: Text(
                          'Clear history',
                          style: AppTypography.bodyBold
                              .copyWith(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

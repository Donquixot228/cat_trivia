
import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:cat_trivia/resources/app_colors.dart';
import 'package:cat_trivia/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnotherCatButton extends StatelessWidget {
  const AnotherCatButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<HomeBloc>().add(GetFact()),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primary4,
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text('Another fact!',
                    style:
                    AppTypography.bodyBold.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cat_trivia/resources/app_typography.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No history yet',
        style: AppTypography.bodyBold.copyWith(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}

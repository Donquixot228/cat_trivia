
import 'package:cat_trivia/pages/history/widgets/clear_button.dart';
import 'package:cat_trivia/pages/history/widgets/history_list.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: const [
          HistoryList(),
          ClearButton(),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  static const String routeName = '/history';

  static Widget create() {
    return const HistoryPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.orange);
  }
}

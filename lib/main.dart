import 'dart:io';

import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:cat_trivia/pages/home/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'repositories/datebase_repository/datebase_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Hive init. Maybe need to move to another place
  Hive.init(Directory.current.path);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => DataBaseRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              dataBaseRepository: DataBaseRepository(Dio()),
            )..add(GetFact()),
          ),
        ],
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'cat_trivia',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:cat_trivia/cubits/navigation_index_cubit/navigation_index_cubit.dart';
import 'package:cat_trivia/pages/home/home_page.dart';
import 'package:cat_trivia/pages/main_controller_page.dart';
import 'package:cat_trivia/repositories/local_repository/local_repository.dart';
import 'package:cat_trivia/services/locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'repositories/datebase_repository/datebase_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => DataBaseRepository,
        ),
        RepositoryProvider(
          create: (_) => LocalRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationIndexCubit()),
          BlocProvider(
            create: (context) => HomeBloc(
              dataBaseRepository: DataBaseRepository(Dio()),
              localRepository: LocalRepository(),
            )..add(InitialSetUp()),
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
      home: MainControllerPage(),
    );
  }
}

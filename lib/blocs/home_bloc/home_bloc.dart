import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cat_trivia/models/fact_model.dart';
import 'package:cat_trivia/models/history_model/hystory_model.dart';
import 'package:cat_trivia/repositories/datebase_repository/datebase_repository.dart';
import 'package:cat_trivia/repositories/local_repository/local_repository.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../constants/constants.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DataBaseRepository _dataBaseRepository;
  final LocalRepository _localRepository;

  HomeBloc({
    required DataBaseRepository dataBaseRepository,
    required LocalRepository localRepository,
  })  : _dataBaseRepository = dataBaseRepository,
        _localRepository = localRepository,
        super(HomeState.initial()) {
    on<InitialSetUp>(
      (event, emit) async {
        _localRepository.init();
        FactModel factModel = await _dataBaseRepository.getFact();
        String imageUrl = '${Constants.catPhotoUrl}?v=${Random().nextInt(100)}';
        emit(
          state.copyWith(
            factModel: factModel,
            imageUrl: imageUrl,
          ),
        );
      },
    );

    on<GetFact>(
      (event, emit) async {
        FactModel factModel = await _dataBaseRepository.getFact();
        String imageUrl = '${Constants.catPhotoUrl}?v=${Random().nextInt(100)}';
        emit(
          state.copyWith(
            factModel: factModel,
            imageUrl: imageUrl,
          ),
        );
        add(SaveLocal(factModel: factModel));
        add(GetHistory());
      },
    );
    on<SaveLocal>(
      (event, emit) async {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
        _localRepository.addToHistory(
          text: event.factModel.fact,
          time: formattedDate,
        );
      },
    );
    on<GetHistory>(
      (event, emit) async {
        final histories = _localRepository.getHistory();
        log(histories.length);
        emit(
          state.copyWith(
            historyList: histories,
          ),
        );
      },
    );
    on<ClearHistory>(
          (event, emit) async {
         _localRepository.clearHistory();
        emit(
          state.copyWith(
            historyList: [],
          ),
        );
      },
    );
  }
}

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cat_trivia/models/fact_model.dart';
import 'package:cat_trivia/models/history_model/hystory_model.dart';
import 'package:cat_trivia/repositories/datebase_repository/datebase_repository.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../constants/constants.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DataBaseRepository _dataBaseRepository;

  HomeBloc({required DataBaseRepository dataBaseRepository})
      : _dataBaseRepository = dataBaseRepository,
        super(HomeState.initial()) {
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
        SaveLocal(
          factModel: factModel,
        );
      },
    );
    on<SaveLocal>(
      (event, emit) async {
        final Box box = await Hive.openBox('kitty history');
        await box.put(
            '${DateTime.now()}',
            HistoryModel(
                text: event.factModel.fact, time: '${DateTime.now()}'));
      },
    );
    on<GetHistory>(
      (event, emit) async {
        final Box box = Hive.box<HistoryModel>('kitty history');
        var histories = <HistoryModel>[];
        for (var key in box.keys) {
          histories.add(box.get(key));
        }
        emit(
          state.copyWith(
            historyList: histories,
          ),
        );
      },
    );
  }
}

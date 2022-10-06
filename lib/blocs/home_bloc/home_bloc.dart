import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cat_trivia/models/fact_model.dart';
import 'package:cat_trivia/repositories/database_repository.dart';
import 'package:meta/meta.dart';

import '../../constants/constants.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DataBaseRepository _dataBaseRepository;

  HomeBloc({required DataBaseRepository dataBaseRepository})
      : _dataBaseRepository = dataBaseRepository,
        super(HomeState.initial()) {
    on<GetFact>((event, emit) async {
      FactModel factModel = await _dataBaseRepository.getFact();
      String imageUrl = '${Constants.catPhotoUrl}?v=${Random().nextInt(100)}';
      emit(
        state.copyWith(
          factModel: factModel,
          imageUrl: imageUrl,
        ),
      );
    });
  }
}

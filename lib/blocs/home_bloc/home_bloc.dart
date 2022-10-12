import 'package:bloc/bloc.dart';
import 'package:cat_trivia/models/cat_model.dart';
import 'package:cat_trivia/models/fact_model.dart';
import 'package:cat_trivia/models/history_model/hystory_model.dart';
import 'package:cat_trivia/repositories/datebase_repository/datebase_repository.dart';
import 'package:cat_trivia/repositories/local_repository/local_repository.dart';
import 'package:cat_trivia/repositories/simple_repository/simple_repository.dart';
import 'package:intl/intl.dart';

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
        emit(state.copyWith(homeStatus: HomeStatus.loading));
        _localRepository.init();
        FactModel factModel = await _dataBaseRepository.getFact();
        CatModel catModel = await SimpleRepository().getCat();
        emit(
          state.copyWith(
            factModel: factModel,
            catModel: catModel,
          ),
        );
        emit(state.copyWith(homeStatus: HomeStatus.initial));
        add(GetHistory());
      },
    );

    on<GetFact>(
      (event, emit) async {
        emit(state.copyWith(homeStatus: HomeStatus.loading));
        CatModel catModel = await SimpleRepository().getCat();
        FactModel factModel = await _dataBaseRepository.getFact();
        emit(
          state.copyWith(
            factModel: factModel,
            catModel: catModel,
          ),
        );
        emit(state.copyWith(homeStatus: HomeStatus.initial));
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

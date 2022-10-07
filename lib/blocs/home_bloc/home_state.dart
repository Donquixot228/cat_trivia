part of 'home_bloc.dart';

enum HomeStatus { initial, loading, successful, error }

class HomeState {
  final FactModel factModel;
  final CatModel catModel;
  final List<HistoryModel> historyList;
  final HomeStatus homeStatus;

  HomeState({
    required this.factModel,
    required this.catModel,
    required this.historyList,
    required this.homeStatus,
  });

  factory HomeState.initial() => HomeState(
        factModel: FactModel(fact: 'Press the button to get a fact'),
        catModel: CatModel.mocked(),
        historyList: [],
        homeStatus: HomeStatus.initial,
      );

  HomeState copyWith({
    FactModel? factModel,
    CatModel? catModel,
    List<HistoryModel>? historyList,
    HomeStatus? homeStatus,
  }) {
    return HomeState(
      factModel: factModel ?? this.factModel,
      catModel: catModel ?? this.catModel,
      homeStatus: homeStatus ?? this.homeStatus,
      historyList: historyList ?? this.historyList,
    );
  }
}

part of 'home_bloc.dart';

enum HomeStatus { initial, loading, successful, error }

class HomeState {
  final FactModel factModel;
  final String imageUrl;
  final List<HistoryModel> historyList;
  final HomeStatus homeStatus;

  HomeState({
    required this.factModel,
    required this.imageUrl,
    required this.historyList,
    required this.homeStatus,
  });

  factory HomeState.initial() => HomeState(
        factModel: FactModel(fact: 'Press the button to get a fact'),
        imageUrl: '',
        historyList: [],
        homeStatus: HomeStatus.initial,
      );

  HomeState copyWith({
    FactModel? factModel,
    String? imageUrl,
    List<HistoryModel>? historyList,
    HomeStatus? homeStatus,
  }) {
    return HomeState(
      factModel: factModel ?? this.factModel,
      imageUrl: imageUrl ?? this.imageUrl,
      homeStatus: homeStatus ?? this.homeStatus,
      historyList: historyList ?? this.historyList,
    );
  }
}

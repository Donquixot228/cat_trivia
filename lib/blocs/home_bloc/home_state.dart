part of 'home_bloc.dart';

class HomeState {
  final FactModel factModel;
  final String imageUrl;
  final List<HistoryModel> historyList;

  HomeState({
    required this.factModel,
    required this.imageUrl,
    required this.historyList,
  });

  factory HomeState.initial() => HomeState(
        factModel: FactModel(fact: 'Press the button to get a fact'),
        imageUrl: '',
        historyList: [],
      );

  HomeState copyWith({
    FactModel? factModel,
    String? imageUrl,
    List<HistoryModel>? historyList,
  }) {
    return HomeState(
      factModel: factModel ?? this.factModel,
      imageUrl: imageUrl ?? this.imageUrl,
      historyList: historyList ?? this.historyList,
    );
  }
}

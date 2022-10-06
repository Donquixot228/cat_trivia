part of 'home_bloc.dart';

class HomeState {
  final FactModel factModel;
  final String imageUrl;

  HomeState({
    required this.factModel,
    required this.imageUrl,
  });

  factory HomeState.initial() => HomeState(
        factModel: FactModel(fact: 'Press the button to get a fact'),
    imageUrl: '',
      );

  HomeState copyWith({
    FactModel? factModel,
    String? imageUrl,
  }) {
    return HomeState(
      factModel: factModel ?? this.factModel,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

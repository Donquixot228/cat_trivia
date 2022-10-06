part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetFact extends HomeEvent {
  GetFact();
}

class InitialSetUp extends HomeEvent {
  InitialSetUp();
}

class SaveLocal extends HomeEvent {
  FactModel factModel;

  SaveLocal({required this.factModel});
}

class GetHistory extends HomeEvent {
  GetHistory();
}

class ClearHistory extends HomeEvent {
  ClearHistory();
}

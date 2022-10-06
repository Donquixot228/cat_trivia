part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class GetFact extends HomeEvent {
  GetFact();
}
class SaveLocal extends HomeEvent {
  FactModel factModel;
  SaveLocal({required this.factModel});
}
class GetHistory extends HomeEvent {
  GetHistory();
}
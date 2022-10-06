import 'package:cat_trivia/models/history_model/hystory_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalRepository {
  late Box<HistoryModel> _history;

  Future<void> init() async {
    Hive.registerAdapter(HistoryModelAdapter());
    _history = await Hive.openBox<HistoryModel>('history');
  }

  List<HistoryModel> getHistory() {
    final tasks = _history.values;
    return tasks.toList();
  }

  Future<void> addToHistory({
    required String text,
    required String time,
  }) async {
    _history.add(
      HistoryModel(
        text: text,
        time: time,
      ),
    );
  }

  Future<void> removeFromHistory(HistoryModel historyModel) async {
    final taskToRemove =
        _history.values.firstWhere((element) => element == historyModel);
    await taskToRemove.delete();
  }

  Future<void> clearHistory() async {
    await _history.clear();
  }
}

import 'package:hive/hive.dart';

part 'hystory_model.g.dart';

@HiveType(typeId: 0)
class HistoryModel extends HiveObject {
  HistoryModel({
    required this.text,
    required this.time,
  });

  @HiveField(0)
  String text;

  @HiveField(1)
  String time;
}

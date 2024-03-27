import 'package:hive/hive.dart';

part 'quiz.g.dart';

@HiveType(typeId: 2)
class Question extends HiveObject {
  @HiveField(0)
  late String questionText;

  @HiveField(1)
  late List<String> options;

  @HiveField(2)
  late int correctAnswerIndex;

  Question(
      {required this.questionText,
      required this.options,
      required this.correctAnswerIndex});
}

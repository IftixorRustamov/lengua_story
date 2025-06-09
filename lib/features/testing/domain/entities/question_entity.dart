class QuestionEntity {
  final String id;
  final String text;
  final List<String> options;
  final String correctAnswer;

  QuestionEntity({
    required this.id,
    required this.text,
    required this.options,
    required this.correctAnswer,
  });
}
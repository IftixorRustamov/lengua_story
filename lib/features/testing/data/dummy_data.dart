import 'package:lingua_story/features/testing/data/models/question_model.dart';

List<QuestionModel> list = [
  QuestionModel(
    id: '1',
    text: 'Where did Bobby find the hat?',
    options: [
      'In the attic',
      'In the garden',
      'In the basement',
      'In the flat',
    ],
    correctAnswer: 'In the attic',
  ),
  QuestionModel(
    id: '2',
    text: 'What color is the sky on a clear day?',
    options: ['Blue', 'Green', 'Red', 'Yellow'],
    correctAnswer: 'Blue',
  ),
  QuestionModel(
    id: '3',
    text: 'Which animal is known as man\'s best friend?',
    options: ['Cat', 'Dog', 'Bird', 'Fish'],
    correctAnswer: 'Dog',
  ),
];

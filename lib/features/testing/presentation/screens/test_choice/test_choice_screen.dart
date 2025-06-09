import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/components/default_button.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/strings/app_strings.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/features/testing/data/dummy_data.dart';
import 'package:lingua_story/features/testing/presentation/widgets/answer_option_button.dart';
import 'package:lingua_story/service_locator.dart';

class TestChoiceScreen extends StatefulWidget {
  const TestChoiceScreen({super.key});

  @override
  State<TestChoiceScreen> createState() => _TestChoiceScreenState();
}

class _TestChoiceScreenState extends State<TestChoiceScreen> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;

  void _selectAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  void _nextQuestion() {
    if (selectedAnswer == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select an answer!')));
      return;
    }

    setState(() {
      if (currentQuestionIndex < list.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null; // Reset selected answer for the next question
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Test Completed!')));
      }
    });
  }

  double get _progress => (currentQuestionIndex + 1) / list.length;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = list[currentQuestionIndex]; // Get current question

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        title: LinearProgressIndicator(
          value: list.isEmpty ? 0 : _progress,
          minHeight: 7,
          backgroundColor: AppColors.white1,
          color: AppColors.primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    currentQuestion.text,
                    style: sl<MulishTextStyles>().bold(
                      color: AppColors.orange,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: appH(70)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: currentQuestion.options.length,
                    itemBuilder: (context, index) {
                      final option = currentQuestion.options[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: AnswerOptionButton(
                          title: option,
                          onPressed: () => _selectAnswer(option),
                          isSelected: selectedAnswer == option,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            DefaultButton(
              title: AppStrings.keyingisi,
              onPressed: _nextQuestion,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/components/default_button.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/strings/app_strings.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/features/testing/presentation/widgets/answer_option_button.dart';
import 'package:lingua_story/service_locator.dart';


class TestTrueFalseScreen extends StatelessWidget {
  const TestTrueFalseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        title: LinearProgressIndicator(
          value: 4,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bobby’s mom did not know anything about the hat",
                    style: sl<MulishTextStyles>().bold(
                      color: AppColors.orange,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: appH(70)),
                  AnswerOptionButton(
                    title: "True",
                    onPressed: () {},
                    isSelected: false,
                  ),
                  SizedBox(height: appH(15),),
                  AnswerOptionButton(
                    title: "False",
                    onPressed: () {} ,
                    isSelected: true,
                  ),
                ],
              ),
            ),
            DefaultButton(title: AppStrings.keyingisi, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/service_locator.dart';

class AnswerOptionButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  const AnswerOptionButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appH(50),
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: isSelected ? AppColors.primary : AppColors.white1,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: sl<MulishTextStyles>().bold(
            color: isSelected ? AppColors.white : AppColors.textFieldTextColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

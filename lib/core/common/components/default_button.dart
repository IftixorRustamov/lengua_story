import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/service_locator.dart';

import '../constants/colors/app_colors.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final bool? isSelected;
  final VoidCallback onPressed;

  const DefaultButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appH(50),
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
        onPressed: onPressed,
        child: Text(
          title,
          style: sl<MulishTextStyles>().bold(
            color: AppColors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

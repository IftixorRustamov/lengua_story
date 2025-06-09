import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/strings/app_strings.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/service_locator.dart';

class AuthCheckboxWg extends StatelessWidget {
  final bool rememberMe;
  final void Function(bool?)? onChanged;

  const AuthCheckboxWg({
    super.key,
    required this.rememberMe,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          side: BorderSide(color: AppColors.orange, width: 2),
          checkColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          activeColor: AppColors.orange,
          value: rememberMe,
          onChanged: onChanged,
        ),
        Text(
          AppStrings.rememberMe,
          style: sl<MulishTextStyles>().bold(
            color: AppColors.textColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

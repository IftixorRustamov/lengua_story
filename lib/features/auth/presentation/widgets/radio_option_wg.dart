import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/jost_textstyle.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/enums/levels_enum.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/service_locator.dart';

class RadioOptionWg extends StatelessWidget {
  final Level value;
  final String title;
  final String description;
  final Level? groupValue;
  final ValueChanged<Level?>? onChanged;

  const RadioOptionWg({
    super.key,
    required this.value,
    required this.title,
    required this.description,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = groupValue == value;

    return Container(
      padding: EdgeInsets.symmetric(vertical: appH(18), horizontal: appW(16)),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.textFieldTextColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Radio<Level>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: sl<JostTextStyles>().semiBold(
                    color: isSelected ? AppColors.primary : AppColors.orange,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: sl<MulishTextStyles>().bold(
                    color: AppColors.textFieldTextColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

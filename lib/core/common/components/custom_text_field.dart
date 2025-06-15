import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/service_locator.dart';

import '../../utils/app_responsive.dart';

class CustomTextFieldWg extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefixIcon;
  final String hintText;
  final VoidCallback? onTap;
  final Widget? trailingWidget;
  final bool obscureText;
 final String? errorText;

  const CustomTextFieldWg({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    this.onTap,
    this.trailingWidget,
    this.errorText,
    this.obscureText = false,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: appH(50),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: appW(16)),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.4,
              color: errorText != null ? Colors.red : AppColors.primary,
            ),
          ),
          child: TextField(
            obscureText: obscureText,
            keyboardType: TextInputType.text,
            style: sl<MulishTextStyles>().bold(
              color: AppColors.textColor,
              fontSize: 14,
            ),
            controller: controller,
            decoration: InputDecoration(
              suffix: trailingWidget,
              icon: Icon(
                prefixIcon,
                size: appH(20),
                color: AppColors.textFieldTextColor,
              ),
              hintText: hintText,
              hintStyle: sl<MulishTextStyles>().bold(
                color: AppColors.textFieldTextColor,
                fontSize: 14,
              ),
              border: InputBorder.none,
            ),
            onTap: onTap,
          ),
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: appH(6), left: appW(8)),
            child: Text(
              errorText!,
              style: sl<MulishTextStyles>().bold(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

}

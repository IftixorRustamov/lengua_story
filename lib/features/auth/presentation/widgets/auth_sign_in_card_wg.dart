import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';

class AuthSignInCardWg extends StatelessWidget {
  final Image imgPath;
  final VoidCallback onTap;

  const AuthSignInCardWg({
    super.key,
    required this.imgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: appW(48),
        height: appH(48),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
              spreadRadius: 1,
            ),
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(48),
        ),
        child: imgPath,
      ),
    );
  }
}

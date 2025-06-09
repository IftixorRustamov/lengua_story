import 'package:flutter/material.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/service_locator.dart';

import '../constants/colors/app_colors.dart';
import '../constants/styles/textstyles/mulish_textstyle.dart';

class ActionAppBarWg extends StatelessWidget implements PreferredSizeWidget {
  const ActionAppBarWg({
    super.key,
    this.titleText,
    required this.onBackPressed,
    this.actions,
  });

  final String? titleText;
  final VoidCallback onBackPressed;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: Text(
        titleText ?? "",
        style: sl<MulishTextStyles>().bold(
          color: AppColors.textColor,
          fontSize: 24,
        ),
      ),
      leading: IconButton(
        onPressed: onBackPressed,
        icon: Icon(
          Icons.arrow_back_ios,
          size: appH(24),
          color: AppColors.black,
        ),
      ),
      actions: actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(color: AppColors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/components/action_app_bar.dart';
import 'package:lingua_story/core/common/components/default_button.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/strings/app_strings.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/jost_textstyle.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/enums/levels_enum.dart';
import 'package:lingua_story/core/routes/app_router.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/features/auth/presentation/widgets/radio_option_wg.dart';
import 'package:lingua_story/features/testing/presentation/screens/diagnostic_test/diagnostic_test_screen.dart';
import 'package:lingua_story/service_locator.dart';

import '../widgets/interests_selection.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(16)),
        child: Column(
          children: [
            // texts
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //spacing: appH(14),
              children: [
                Text(
                  AppStrings.kelingQiziqishlarinzgizni,
                  style: sl<JostTextStyles>().semiBold(
                    color: AppColors.orange,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: appH(8)),
                Text(
                  AppStrings.choosingInterests1,
                  textAlign: TextAlign.center,
                  style: sl<MulishTextStyles>().bold(
                    color: AppColors.textColor,
                    fontSize: 11,
                  ),
                ),
                Text(
                  AppStrings.choosingInterests12,
                  textAlign: TextAlign.center,
                  style: sl<MulishTextStyles>().bold(
                    color: AppColors.textColor,
                    fontSize: 11,
                  ),
                ),
                SizedBox(height: appH(22)),
              ],
            ),
            SelectableCategoryGrid(),
            SizedBox(height: appH(95)),
            DefaultButton(
              title: AppStrings.confirm,
              onPressed: () {
                AppRouter.go(DiagnosticTestScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

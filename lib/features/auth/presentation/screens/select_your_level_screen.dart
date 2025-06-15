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
import 'package:lingua_story/service_locator.dart';

import '../../../by_interets/presentation/screens/interests_screen.dart';

class SelectYourLevelScreen extends StatefulWidget {
  const SelectYourLevelScreen({super.key});

  @override
  State<SelectYourLevelScreen> createState() => _SelectYourLevelScreenState();
}

class _SelectYourLevelScreenState extends State<SelectYourLevelScreen> {
  Level? _selectedLevel = Level.beginner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
          onBackPressed: () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: appH(16),
              children: [
                Text(
                  AppStrings.selectYourLevel,
                  style: sl<JostTextStyles>().semiBold(
                    color: AppColors.orange,
                    fontSize: 20,
                  ),
                ),
                Text(
                  AppStrings.selectYourLevelSubText,
                  textAlign: TextAlign.center,
                  style: sl<MulishTextStyles>().bold700(
                    color: AppColors.black,
                    fontSize: 12,
                  ),
                ),
                RadioOptionWg(
                  value: Level.beginner,
                  title: 'BEGINNER',
                  description:
                      'Sodda matnlarni tushunadiganlar uchun: kundalik iboralar va oddiy jumlalar',
                  groupValue: _selectedLevel,
                  onChanged: (Level? newValue) {
                    setState(() {
                      _selectedLevel = newValue;
                    });
                  },
                ),
                RadioOptionWg(
                  value: Level.elementary,
                  title: 'ELEMENTARY',
                  description:
                      'Sodda matnlarni tushunadiganlar uchun: kundalik iboralar va oddiy jumlalar',
                  groupValue: _selectedLevel,
                  onChanged: (Level? newValue) {
                    setState(() {
                      _selectedLevel = newValue;
                    });
                  },
                ),
                RadioOptionWg(
                  value: Level.preIntermediate,
                  title: 'PRE-INTERMEDIATE',
                  description:
                      'O\'rta darajadagi foydalanuvchilar uchun: qiysqa hikoyalar va mantiqiy muoloqotlar',
                  groupValue: _selectedLevel,
                  onChanged: (Level? newValue) {
                    setState(() {
                      _selectedLevel = newValue;
                    });
                  },
                ),
                RadioOptionWg(
                  value: Level.intermediate,
                  title: 'INTERMEDIATE',
                  description:
                      'O\'rta darajadagi foydalanuvchilar uchun: qiysqa hikoyalar va mantiqiy muoloqotlar',
                  groupValue: _selectedLevel,
                  onChanged: (Level? newValue) {
                    setState(() {
                      _selectedLevel = newValue;
                    });
                  },
                ),
              ],
            ),
            DefaultButton(
              title: AppStrings.confirm,
              onPressed: () {
                AppRouter.go(InterestsScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

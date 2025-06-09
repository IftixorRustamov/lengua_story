import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/components/action_app_bar.dart';
import 'package:lingua_story/core/common/components/default_button.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/strings/app_strings.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/jost_textstyle.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/service_locator.dart';

class DiagnosticTestScreen extends StatelessWidget {
  const DiagnosticTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(onBackPressed: () {}),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: appH(20),
              children: [
                Image.asset("assets/images/test_note.png"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.diagnosticTest,
                      style: sl<JostTextStyles>().semiBold(
                        color: AppColors.orange,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      AppStrings.diagnosticTestSub,
                      textAlign: TextAlign.center,
                      style: sl<MulishTextStyles>().bold(
                        color: AppColors.textColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: appH(225),
                  padding: EdgeInsets.symmetric(
                    horizontal: appW(30),
                    vertical: appH(30),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.orange, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _customRow(
                        title: AppStrings.qiyinlikDarajasi,
                        subText: AppStrings.ortacha,
                        icon: Icons.pie_chart,
                      ),
                      _customRow(
                        title: AppStrings.berilganVaqt,
                        subText: AppStrings.daqiqa15,
                        icon: Icons.access_time_filled,
                      ),
                      _customRow(
                        title: AppStrings.testlarSoni,
                        subText: AppStrings.testlarSoniSub,
                        icon: Icons.checklist,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DefaultButton(title: AppStrings.boshlash, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

Widget _customRow({
  required String title,
  required String subText,
  required IconData icon,
}) => Row(
  children: [
    Container(
      height: appH(40),
      width: appW(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColors.primary,
      ),
      child: Icon(icon, color: AppColors.white),
    ),
    SizedBox(width: appW(25)),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: sl<MulishTextStyles>().bold(
            color: AppColors.primary,
            fontSize: 18,
          ),
        ),
        Text(
          AppStrings.ortacha,
          style: sl<MulishTextStyles>().bold(
            color: AppColors.textFieldTextColor,
            fontSize: 14,
          ),
        ),
      ],
    ),
  ],
);

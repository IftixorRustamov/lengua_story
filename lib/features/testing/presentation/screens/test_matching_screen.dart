import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/components/default_button.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/strings/app_strings.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/service_locator.dart';

class TestMatchingScreen extends StatelessWidget {
  const TestMatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        title: LinearProgressIndicator(
          value: 4,
          minHeight: 7,
          backgroundColor: AppColors.white1,
          color: AppColors.primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(25)),
        child: Column(
          children: [
            Text(
              AppStrings.matchWords,
              textAlign: TextAlign.center,
              style: sl<MulishTextStyles>().bold(
                color: AppColors.black1,
                fontSize: 20,
              ),
            ),
            SizedBox(height: appH(35)),
            Expanded(
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.7 / 1,
                  crossAxisSpacing: appW(25),
                  mainAxisSpacing: appH(15),
                ),
                itemBuilder:
                    (context, state) => Container(
                      alignment: Alignment.center,
                      height: appH(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.primary,
                      ),
                      child: Text(
                        "Red ball",
                        style: sl<MulishTextStyles>().bold(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
              ),
            ),
            DefaultButton(title: AppStrings.keyingisi, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

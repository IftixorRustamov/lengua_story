import 'package:flutter/material.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/strings/app_strings.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/jost_textstyle.dart';
import 'package:lingua_story/core/routes/app_router.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/features/auth/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:lingua_story/service_locator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    widgetsBinding.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        AppRouter.open(SignInScreen());
      });
    });
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: appW(20),
          vertical: appH(100),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Logo.png",
                      height: appH(169),
                      width: appW(203),
                    ),
                    Text(
                      AppStrings.splashMoto,
                      style: sl<JostTextStyles>().semiBold(
                        color: AppColors.orange,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

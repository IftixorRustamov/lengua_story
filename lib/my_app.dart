import 'package:flutter/material.dart';
import 'package:lingua_story/core/routes/app_router.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/features/testing/presentation/screens/test_choice/test_choice_screen.dart';
import 'package:lingua_story/features/testing/presentation/screens/test_matching_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.navigatorKey,
      home: TestMatchingScreen(),
    );
  }
}

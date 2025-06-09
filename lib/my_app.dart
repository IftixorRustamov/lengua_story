import 'package:flutter/material.dart';
import 'package:lingua_story/core/routes/app_router.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'features/auth/presentation/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.navigatorKey,
      home: SplashScreen(),
    );
  }
}

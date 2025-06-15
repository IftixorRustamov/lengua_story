import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_story/core/routes/app_router.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:lingua_story/features/auth/presentation/bloc/user_info/user_info_bloc.dart';
import 'package:lingua_story/features/auth/presentation/screens/splash_screen.dart';
import 'package:lingua_story/service_locator.dart';
import 'features/auth/presentation/bloc/confirm_gmail/confirm_gmail_bloc.dart';
import 'features/auth/presentation/bloc/verify_code/verify_code_bloc.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<EmailConfirmationBloc>()),
        BlocProvider(create: (_) => sl<VerifyCodeBloc>()),
        BlocProvider(create: (_) => sl<UserInfoBloc>()),
        BlocProvider(create: (_) => sl<SignInBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRouter.navigatorKey,
        home: SplashScreen(),
      ),
    );
  }
}

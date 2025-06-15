import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_story/core/common/components/custom_text_field.dart';
import 'package:lingua_story/core/common/components/default_button.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/strings/app_strings.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/jost_textstyle.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/routes/app_router.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/features/auth/presentation/bloc/auth_event.dart';
import 'package:lingua_story/features/auth/presentation/screens/select_your_level_screen.dart';
import 'package:lingua_story/features/auth/presentation/screens/sign_up.dart';
import 'package:lingua_story/features/auth/presentation/widgets/auth_check_box_wg.dart';
import 'package:lingua_story/features/auth/presentation/widgets/auth_sign_in_card_wg.dart';
import 'package:lingua_story/service_locator.dart';

import '../bloc/sign_in/sign_in_bloc.dart';
import '../bloc/sign_in/sign_in_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false;

  void signIn() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || !email.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Iltimos, to‘g‘ri email kiriting!")),
      );
      return;
    }
    if (password.isEmpty || password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Parol kamida 6 ta belgidan iborat bo‘lishi kerak."),
        ),
      );
      return;
    }

    context.read<SignInBloc>().add(
      SignInEvent(email: email, password: password),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(70)),
        child: SingleChildScrollView(
          child: Column(
            spacing: appH(18),
            children: [
              Image.asset("assets/images/Logo.png"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.tizimgaKirish,
                    style: sl<JostTextStyles>().semiBold(
                      color: AppColors.orange,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    AppStrings.tizimgaKirishSubText,
                    style: sl<MulishTextStyles>().bold(
                      color: AppColors.textColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              CustomTextFieldWg(
                controller: _emailController,
                prefixIcon: Icons.email_outlined,
                hintText: AppStrings.email,
              ),
              CustomTextFieldWg(
                controller: _passwordController,
                prefixIcon: Icons.lock_outline,
                hintText: AppStrings.parol,
                onTap: () {},
                trailingWidget: Icon(Icons.visibility_off_outlined),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AuthCheckboxWg(
                    rememberMe: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text(
                    AppStrings.forgotPassword,
                    style: sl<MulishTextStyles>().bold(
                      color: AppColors.primary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              BlocConsumer<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return DefaultButton(
                    title: AppStrings.signIn,
                    onPressed: () {
                      signIn();
                    },
                  );
                },
                listener: (context, state) {
                  if (state is SignInSuccess) {
                    AppRouter.go(const SelectYourLevelScreen());
                  } else if (state is SignInFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
              ),


              Text(
                AppStrings.or,
                style: sl<MulishTextStyles>().bold(
                  color: AppColors.orange,
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AuthSignInCardWg(
                    imgPath: Image.asset("assets/images/google.png"),
                    onTap: () {},
                  ),
                  AuthSignInCardWg(
                    imgPath: Image.asset("assets/images/apple.png"),
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hisobingiz yo'qmi? ",
                    style: sl<MulishTextStyles>().bold(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AppRouter.go(SignUpScreen());
                    },
                    child: Text(
                      "Ro'yxatdan o'ting",
                      style: sl<MulishTextStyles>().semiBold(
                        color: AppColors.orange,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

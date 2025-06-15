import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lingua_story/core/common/components/custom_text_field.dart';
import 'package:lingua_story/core/common/components/default_button.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/strings/app_strings.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/jost_textstyle.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/routes/app_router.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/features/auth/presentation/bloc/auth_event.dart';
import 'package:lingua_story/features/auth/presentation/bloc/confirm_gmail/confirm_gmail_bloc.dart';
import 'package:lingua_story/features/auth/presentation/bloc/confirm_gmail/confirm_gmail_state.dart';
import 'package:lingua_story/features/auth/presentation/screens/select_your_level_screen.dart';
import 'package:lingua_story/features/auth/presentation/screens/verify_code_screen.dart';
import 'package:lingua_story/features/auth/presentation/widgets/auth_check_box_wg.dart';
import 'package:lingua_story/features/auth/presentation/widgets/auth_sign_in_card_wg.dart';
import 'package:lingua_story/service_locator.dart';

import '../../../../core/common/components/action_app_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _emailError;

  void _handleEmailSubmission() {
    final email = _emailController.text.trim();

    setState(() {
      _emailError = null;
    });

    final isValidEmail = RegExp(r"^[\w-\.]+@gmail\.com$").hasMatch(email);

    if (email.isEmpty) {
      setState(() {
        _emailError = "Email kiritilishi kerak.";
      });
      return;
    } else if (!isValidEmail) {
      setState(() {
        _emailError =
            "Faqat @gmail.com bilan tugaydigan to‘g‘ri email kiriting.";
      });
      return;
    }

    context.read<EmailConfirmationBloc>().add(EmailConfEvent(email: email));
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/Logo.png"),
              SizedBox(height: appH(18)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.royxatdanOtish,
                          style: sl<JostTextStyles>().bold(
                            color: AppColors.orange,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          AppStrings.royxatdanOtishSub,
                          style: sl<MulishTextStyles>().bold(
                            color: AppColors.textColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: appH(18)),
              CustomTextFieldWg(
                controller: _emailController,
                prefixIcon: Icons.email_outlined,
                hintText: AppStrings.email,
                errorText: _emailError,
              ),
              SizedBox(height: appH(260)),
              BlocConsumer<EmailConfirmationBloc, EmailConfirmationState>(
                listener: (context, state) {
                  if (state is EmailConfirmationSuccess) {
                    final box = Hive.box('authBox');
                    box.put('verify_key', state.emailConfEntity.key);
                    AppRouter.go(
                      VerifyCodeScreen(),
                    );
                  } else if (state is EmailConfirmationFailure) {
                    final error = state.error.toLowerCase();
                    if (error.contains("exists") || error.contains("already")) {
                      setState(() {
                        _emailError = "Bu Gmail allaqachon ro'yxatdan o'tgan!";
                      });
                    } else {
                      setState(() {
                        _emailError = "Email noto‘g‘ri yoki mavjud emas.";
                      });
                    }
                  }
                },
                builder: (context, state) {
                  final isLoading = state is EmailConfirmationLoading;
                  return isLoading
                      ? Center(child: CircularProgressIndicator())
                      : DefaultButton(
                        title: AppStrings.davomEtish,
                        onPressed: _handleEmailSubmission,
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

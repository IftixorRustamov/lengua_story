import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lingua_story/core/common/components/default_button.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:lingua_story/core/common/constants/strings/app_strings.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/jost_textstyle.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/core/routes/app_router.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';
import 'package:lingua_story/features/auth/presentation/bloc/auth_event.dart';
import 'package:lingua_story/features/auth/presentation/bloc/verify_code/verify_code_bloc.dart';
import 'package:lingua_story/features/auth/presentation/bloc/verify_code/verify_code_state.dart';
import 'package:lingua_story/service_locator.dart';

import '../../../../core/common/components/action_app_bar.dart';
import '../widgets/confirm_input.dart';
import 'user_infos_screen.dart';

class VerifyCodeScreen extends StatefulWidget {

  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _pinController = TextEditingController();
  String? _errorText;


  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _verifyCode() {
    final code = _pinController.text;
    final box = Hive.box('authBox');
    final key = box.get('verify_key');

    if (code.length != 6) {
      setState(() {
        _errorText = "Iltimos, 6 xonali kodni kiriting!";
      });
      return;
    }
    setState(() {
      _errorText = null;
    });

    context.read<VerifyCodeBloc>().add(
      VerifyCodeEvent(code: code, key: key),
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCodeBloc, VerifyCodeState>(
      listener: (context, state) {
        if (state is VerifyCodeSuccess) {
          AppRouter.go(UserInfosScreen());
        } else if (state is VerifyCodeFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: ActionAppBarWg(onBackPressed: () => Navigator.pop(context)),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appW(20),
              vertical: appH(16),
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: appH(18),
                children: [
                  Image.asset("assets/images/Logo.png"),
                  // texts
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.tasdiqlovchiKod,
                          style: sl<JostTextStyles>().semiBold(
                            color: AppColors.textFieldTextColor,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          AppStrings.userGmail,
                          style: sl<MulishTextStyles>().bold(
                            color: AppColors.orange,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ConfirmInput(
                    onCompleted: (_) => setState(() {}),
                    onChanged: (_) {
                      if (_errorText != null) {
                        setState(() {
                          _errorText = null;
                        });
                      }
                    },
                    pinController: _pinController,
                    errorText: _errorText, 
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.kod,
                          style: sl<JostTextStyles>().semiBold(
                            color: AppColors.textFieldTextColor,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          AppStrings.time,
                          style: sl<MulishTextStyles>().bold(
                            color: AppColors.primary,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          AppStrings.timeSaid,
                          style: sl<JostTextStyles>().semiBold(
                            color: AppColors.textFieldTextColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: appH(260)),

                  if (state is VerifyCodeLoading)
                    const CircularProgressIndicator()
                  else
                    DefaultButton(
                      title: AppStrings.davomEtish,
                      onPressed: _verifyCode,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

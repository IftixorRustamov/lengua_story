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
import 'package:lingua_story/features/auth/presentation/bloc/user_info/user_info_bloc.dart';
import 'package:lingua_story/features/auth/presentation/bloc/user_info/user_info_state.dart';
import 'package:lingua_story/features/auth/presentation/screens/select_your_level_screen.dart';
import 'package:lingua_story/features/auth/presentation/screens/sign_up.dart';
import 'package:lingua_story/features/auth/presentation/screens/verify_code_screen.dart';
import 'package:lingua_story/features/auth/presentation/widgets/auth_check_box_wg.dart';
import 'package:lingua_story/features/auth/presentation/widgets/auth_sign_in_card_wg.dart';
import 'package:lingua_story/service_locator.dart';

import '../../../../core/common/components/action_app_bar.dart';

class UserInfosScreen extends StatefulWidget {

  const UserInfosScreen({super.key});

  @override
  State<UserInfosScreen> createState() => _UserInfosScreenState();
}


class _UserInfosScreenState extends State<UserInfosScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void userInfos() {
    final key = Hive.box('authBox').get('verify_key');

    final username = _usernameController.text.trim();
    final birthDate = _birthDateController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (username.isEmpty) {
      _showError("Foydalanuvchi nomi bo‘sh bo‘lmasligi kerak");
      return;
    }
    if (birthDate.isEmpty || !_isValidDate(birthDate)) {
      _showError("Tug‘ilgan sana noto‘g‘ri yoki bo‘sh");
      return;
    }
    if (password.length < 6) {
      _showError("Parol kamida 6 ta belgidan iborat bo‘lishi kerak");
      return;
    }
    if (password != confirmPassword) {
      _showError("Parollar mos kelmayapti");
      return;
    }

    context.read<UserInfoBloc>().add(
      UserInfoEvent(
        username: username,
        birthDate: birthDate,
        password: password,
        confirmPassword: confirmPassword,
        key: key,
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  bool _isValidDate(String input) {
    try {
      final date = DateTime.parse(input);
      return true;
    } catch (_) {
      return false;
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year.toString().padLeft(4, '0')}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
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
            spacing: appH(16),
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.blue.withOpacity(0.1),
                child: Icon(Icons.person, size: 140, color: Colors.white),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.reg,
                          style: sl<MulishTextStyles>().bold700(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          AppStrings.reg2,
                          style: sl<MulishTextStyles>().bold(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomTextFieldWg(
                controller: _usernameController,
                prefixIcon: Icons.email_outlined,
                hintText: AppStrings.username,
              ),
              CustomTextFieldWg(
                controller: _birthDateController,
                prefixIcon: Icons.calendar_month_outlined,
                hintText: AppStrings.tugilganSana,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2005),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    _birthDateController.text = _formatDate(pickedDate);
                  }
                },
              ),
              CustomTextFieldWg(
                controller: _passwordController,
                prefixIcon: Icons.lock_outline,
                hintText: AppStrings.changePassword,
                onTap: () {},
                trailingWidget: Icon(Icons.visibility_off_outlined),
              ),
              CustomTextFieldWg(
                controller: _confirmPasswordController,
                prefixIcon: Icons.lock_outline,
                hintText: AppStrings.confirmPassword,
                onTap: () {},
                trailingWidget: Icon(Icons.visibility_off_outlined),
              ),
              SizedBox(height: appH(90)),
              BlocConsumer<UserInfoBloc, UserInfoState>(
                builder: (context, state) {
                  final isLoading = state is UserInfoLoading;
                  return isLoading
                      ? Center(child: CircularProgressIndicator())
                      : DefaultButton(
                    title: AppStrings.davomEtish,
                    onPressed: () {
                      userInfos();
                    },
                  );
                },
                listener: (context, state) {
                  if (state is UserInfoSuccess) {
                    AppRouter.go(
                      SelectYourLevelScreen(),
                    );
                  }else if (state is UserInfoFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Xatolik yuz berdi, qayta urinib ko’ring!",
                        ),
                      ),
                    );

                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

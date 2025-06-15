import 'package:lingua_story/features/auth/data/model/email_conf_model.dart';
import 'package:lingua_story/features/auth/data/model/sign_in_model.dart';
import 'package:lingua_story/features/auth/data/model/user_info_model.dart';
import 'package:lingua_story/features/auth/data/model/verify_code_model.dart';

abstract class AuthRemoteDataSource {
  Future<EmailConfModel> emailConfirmation({required String email});

  Future<VerifyCodeModel> verifyCode({
    required String code,
    required String key,
  });

  Future<UserInfoModel> userInfo({
    required String username,
    required String birthDate,
    required String password,
    required String confirmPassword,
    required String key,
  });

  Future<SignInResponseModel> signIn({
    required String email,
    required String password,
  });
}
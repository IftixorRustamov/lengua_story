import 'package:lingua_story/features/auth/domain/entity/email_conf_entity.dart';
import 'package:lingua_story/features/auth/domain/entity/sign_in_entity.dart';
import 'package:lingua_story/features/auth/domain/entity/user_info_entity.dart';
import 'package:lingua_story/features/auth/domain/entity/verify_code_entity.dart';

abstract class AuthRepository {
  Future<EmailConfEntity> emailConfirmation({required String email});

  Future<VerifyCodeEntity> verifyCode({
    required String code,
    required String key,
  });

  Future<UserInfoEntity> userInfo({
    required String username,
    required String birthDate,
    required String password,
    required String confirmPassword,
    required String key,
  });

  Future<SignInResponseEntity> signIn({
    required String email,
    required String password,
  });
}

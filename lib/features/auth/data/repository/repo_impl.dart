import 'package:lingua_story/features/auth/domain/entity/email_conf_entity.dart';
import 'package:lingua_story/features/auth/domain/entity/sign_in_entity.dart';
import 'package:lingua_story/features/auth/domain/entity/user_info_entity.dart';
import 'package:lingua_story/features/auth/domain/entity/verify_code_entity.dart';
import '../../domain/repository/auth_repo.dart';
import '../remote_datasource/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<EmailConfEntity> emailConfirmation({required String email})async {
    return await remoteDataSource.emailConfirmation(email: email);
  }

  @override
  Future<SignInResponseEntity> signIn({required String email, required String password})async {
    return await remoteDataSource.signIn(email: email, password: password);
  }

  @override
  Future<UserInfoEntity> userInfo({required String username, required String birthDate, required String password, required String confirmPassword, required String key})async {
   return await remoteDataSource.userInfo(username: username, birthDate: birthDate, password: password, confirmPassword: confirmPassword, key: key);
  }

  @override
  Future<VerifyCodeEntity> verifyCode({required String code, required String key})async {
   return await remoteDataSource.verifyCode(code: code, key: key);
  }


}

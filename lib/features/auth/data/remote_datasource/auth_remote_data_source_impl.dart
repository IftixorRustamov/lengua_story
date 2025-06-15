import 'package:lingua_story/features/auth/data/model/email_conf_model.dart';
import 'package:lingua_story/features/auth/data/model/sign_in_model.dart';
import 'package:lingua_story/features/auth/data/model/user_info_model.dart';
import 'package:lingua_story/features/auth/data/model/verify_code_model.dart';
import 'package:lingua_story/features/auth/data/remote_datasource/auth_remote_data_source.dart';
import '../../../../core/common/constants/strings/api_urls.dart';
import '../../../../core/network/dio_client.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<SignInResponseModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(ApiUrls.signIn,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return SignInResponseModel.fromJson(response.data);
      } else {
        throw Exception("Error: ${response.statusMessage}");
      }
    } catch (e) {
      print("Dio error : ${e.toString()}");
      throw Exception("Dio error : ${e.toString()}");
    }
  }

  @override
  Future<EmailConfModel> emailConfirmation({required String email}) async {
    try {
      final response = await dioClient.post(ApiUrls.emailConfirm,
        data: {
          "email": email,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return EmailConfModel.fromJson(response.data);
      } else {
        throw Exception("Error: ${response.statusMessage}");
      }
    } catch (e) {
      print("Dio error : ${e.toString()}");
      throw Exception("Dio error : ${e.toString()}");
    }
  }

  @override
  Future<UserInfoModel> userInfo({
    required String username,
    required String birthDate,
    required String password,
    required String confirmPassword,
    required String key,
  }) async {
    try {
      final response = await dioClient.post(ApiUrls.signUp,
        data: {
          "username": username,
          "birth_date": birthDate,
          "password": password,
          "confirm_password": confirmPassword,
          "key": key,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserInfoModel.fromJson(response.data);
      } else {
        throw Exception("Error: ${response.statusMessage}");
      }
    } catch (e) {
      print("Dio error : ${e.toString()}");
      throw Exception("Dio error : ${e.toString()}");
    }
  }

  @override
  Future<VerifyCodeModel> verifyCode({
    required String code,
    required String key,
  }) async {
    try {
      final response = await dioClient.post(ApiUrls.verifyCode,
        data: {
          "code": code,
          "key": key,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return VerifyCodeModel.fromJson(response.data);
      } else {
        throw Exception("Error: ${response.statusMessage}");
      }
    } catch (e) {
      print("Dio error : ${e.toString()}");
      throw Exception("Dio error : ${e.toString()}");
    }
  }
}
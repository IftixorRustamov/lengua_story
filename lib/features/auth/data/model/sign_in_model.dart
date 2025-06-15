
import '../../domain/entity/sign_in_entity.dart';

class SignInResponseModel extends SignInResponseEntity {
   SignInResponseModel({
    required super.message,
    required super.refresh,
    required super.access,
  });

  /// Parse JSON to model
  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      message: json['message'] as String,
      refresh: json['refresh'] as String,
      access: json['access'] as String,
    );
  }

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'refresh': refresh,
      'access': access,
    };
  }
}

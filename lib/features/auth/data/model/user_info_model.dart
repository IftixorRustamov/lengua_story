
import '../../domain/entity/user_info_entity.dart';

class UserInfoModel extends UserInfoEntity {
   UserInfoModel({
    required super.success,
    required super.message,
    required super.refresh,
    required super.access,
  });

  /// Convert JSON map to UserInfoModel
  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      refresh: json['refresh'] as String,
      access: json['access'] as String,
    );
  }

  /// Convert UserInfoModel to JSON map
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'refresh': refresh,
      'access': access,
    };
  }
}

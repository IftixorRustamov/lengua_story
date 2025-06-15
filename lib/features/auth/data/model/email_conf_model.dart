import 'package:lingua_story/features/auth/domain/entity/email_conf_entity.dart';

class EmailConfModel extends EmailConfEntity {
  const EmailConfModel({
    required super.key,
    required super.message,
  });

  factory EmailConfModel.fromJson(Map<String, dynamic> json) {
    return EmailConfModel(
      key: json['key'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'key': key,
    'message': message,
  };
}

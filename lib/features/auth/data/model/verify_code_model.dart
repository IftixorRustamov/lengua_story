
import '../../domain/entity/verify_code_entity.dart';

class VerifyCodeModel extends VerifyCodeEntity {
  const VerifyCodeModel({required super.message});

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) {
    return VerifyCodeModel(message: json['message'] as String);
  }

  Map<String, dynamic> toJson() => {
    'message': message,
  };
}

import 'package:lingua_story/features/auth/domain/entity/verify_code_entity.dart';

abstract class VerifyCodeState {}

class VerifyCodeInitial extends VerifyCodeState {}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeSuccess extends VerifyCodeState {
  final VerifyCodeEntity verifyCodeEntity;

  VerifyCodeSuccess({required this.verifyCodeEntity});
}

class VerifyCodeFailure extends VerifyCodeState {
  final String error;

  VerifyCodeFailure({ required this.error});
}

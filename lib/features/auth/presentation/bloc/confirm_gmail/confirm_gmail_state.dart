import 'package:lingua_story/features/auth/domain/entity/email_conf_entity.dart';

abstract class EmailConfirmationState {}

class EmailConfirmationInitial extends EmailConfirmationState {}

class EmailConfirmationLoading extends EmailConfirmationState {}

class EmailConfirmationSuccess extends EmailConfirmationState {
  final EmailConfEntity emailConfEntity;

  EmailConfirmationSuccess({required this.emailConfEntity});
}

class EmailConfirmationFailure extends EmailConfirmationState {
  final String error;

  EmailConfirmationFailure({ required this.error});
}

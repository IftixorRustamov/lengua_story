import 'package:equatable/equatable.dart';
import 'package:lingua_story/features/auth/domain/entity/sign_in_entity.dart';

abstract class SignInState  {
   const SignInState();

}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final SignInResponseEntity signInResponseEntity;

  const SignInSuccess({required this.signInResponseEntity});

}

class SignInFailure extends SignInState {
  final String error;

  const SignInFailure({required this.error});

}

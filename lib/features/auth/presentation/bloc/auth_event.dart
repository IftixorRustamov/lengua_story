abstract class AuthEvent {}

class EmailConfEvent extends AuthEvent {
  final String email;

  EmailConfEvent({required this.email});
}

class VerifyCodeEvent extends AuthEvent {
  final String code;
  final String key;

  VerifyCodeEvent({required this.code, required this.key});
}

class UserInfoEvent extends AuthEvent {
  final String username;
  final String birthDate;
  final String password;
  final String confirmPassword;
  final String key;

  UserInfoEvent({
    required this.username,
    required this.birthDate,
    required this.password,
    required this.confirmPassword,
    required this.key,
  });
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

   SignInEvent({required this.email, required this.password});
}

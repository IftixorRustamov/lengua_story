class SignInResponseEntity {
  final String message;
  final String refresh;
  final String access;

  SignInResponseEntity({
    required this.message,
    required this.refresh,
    required this.access,
  });
}
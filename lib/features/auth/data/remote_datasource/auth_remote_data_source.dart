abstract class AuthRemoteDataSource {
  Future<void> signIn({required String email, required String password});
}
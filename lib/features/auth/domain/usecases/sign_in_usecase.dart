
import '../repository/auth_repo.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<void> call({required String email, required String password}) {
    return repository.signIn(email: email, password: password);
  }
}

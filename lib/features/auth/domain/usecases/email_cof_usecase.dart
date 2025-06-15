import '../entity/email_conf_entity.dart';
import '../repository/auth_repo.dart';

class EmailConfirmationUseCase {
  final AuthRepository repository;

  EmailConfirmationUseCase(this.repository);

  Future<EmailConfEntity> call({required String email}) {
    return repository.emailConfirmation(email: email);
  }
}

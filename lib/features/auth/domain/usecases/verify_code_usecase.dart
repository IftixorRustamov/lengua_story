import '../entity/verify_code_entity.dart';
import '../repository/auth_repo.dart';

class VerifyCodeUseCase {
  final AuthRepository repository;

  VerifyCodeUseCase(this.repository);

  Future<VerifyCodeEntity> call({
    required String code,
    required String key,
  }) {
    return repository.verifyCode(code: code, key: key);
  }
}

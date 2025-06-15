import '../entity/user_info_entity.dart';
import '../repository/auth_repo.dart';

class UserInfoUseCase {
  final AuthRepository repository;

  UserInfoUseCase(this.repository);

  Future<UserInfoEntity> call({
    required String username,
    required String birthDate,
    required String password,
    required String confirmPassword,
    required String key,
  }) {
    return repository.userInfo(
      username: username,
      birthDate: birthDate,
      password: password,
      confirmPassword: confirmPassword,
      key: key,
    );
  }
}

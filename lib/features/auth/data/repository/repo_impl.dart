import '../../domain/repository/auth_repo.dart';
import '../remote_datasource/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> signIn({required String email, required String password}) {
    return remoteDataSource.signIn(email: email, password: password);
  }
}

import 'package:get_it/get_it.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/app_textstyles.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/jost_textstyle.dart';
import 'package:lingua_story/core/common/constants/styles/textstyles/mulish_textstyle.dart';
import 'package:lingua_story/features/auth/data/remote_datasource/auth_remote_data_source.dart';
import 'package:lingua_story/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:lingua_story/features/auth/presentation/bloc/user_info/user_info_bloc.dart';

import 'core/network/dio_client.dart';
import 'features/auth/data/remote_datasource/auth_remote_data_source_impl.dart';
import 'features/auth/data/repository/repo_impl.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/auth/domain/usecases/email_cof_usecase.dart';
import 'features/auth/domain/usecases/sign_in_usecase.dart';
import 'features/auth/domain/usecases/user_info_usecase.dart';
import 'features/auth/domain/usecases/verify_code_usecase.dart';
import 'features/auth/presentation/bloc/confirm_gmail/confirm_gmail_bloc.dart';
import 'features/auth/presentation/bloc/verify_code/verify_code_bloc.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerSingleton<AppTextStyles>(JostTextStyles());
  sl.registerSingleton<JostTextStyles>(JostTextStyles());
  sl.registerSingleton<MulishTextStyles>(MulishTextStyles());
  sl.registerSingleton<DioClient>(DioClient());

  /// 🔹 Bloclar
  sl.registerFactory(() => EmailConfirmationBloc(emailConfirmationUseCase: sl()));
  sl.registerFactory(() => VerifyCodeBloc(verifyCodeUseCase:  sl()));
  sl.registerFactory(() => UserInfoBloc(userInfoUseCase:  sl()));
  sl.registerFactory(() => SignInBloc(signInUseCase:   sl()));

  /// 🔹 UseCaselar
  sl.registerLazySingleton(() => EmailConfirmationUseCase(sl()));
  sl.registerLazySingleton(() => VerifyCodeUseCase(sl()));
  sl.registerLazySingleton(() => UserInfoUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  /// 🔹 Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource:  sl()));

  /// 🔹 Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(dioClient:  sl<DioClient>()),
  );
}



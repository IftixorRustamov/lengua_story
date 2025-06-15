import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_story/features/auth/presentation/bloc/auth_event.dart';
import 'user_info_state.dart';
import '../../../domain/usecases/user_info_usecase.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserInfoUseCase userInfoUseCase;

  UserInfoBloc({required this.userInfoUseCase}) : super(UserInfoInitial()) {
    on<UserInfoEvent>((event, emit) async {
      emit(UserInfoLoading());
      try {
        final userInfo = await userInfoUseCase.call(
          username: event.username,
          birthDate: event.birthDate,
          password: event.password,
          confirmPassword: event.confirmPassword,
          key: event.key,
        );
        emit(UserInfoSuccess(userInfoEntity: userInfo));
      } catch (e) {
        emit(UserInfoFailure(e.toString()));
      }
    });
  }
}

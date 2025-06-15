import 'package:lingua_story/features/auth/domain/entity/user_info_entity.dart';

abstract class UserInfoState {
  const UserInfoState();
}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoSuccess extends UserInfoState {
  final UserInfoEntity userInfoEntity;

  const UserInfoSuccess({required this.userInfoEntity});
}

class UserInfoFailure extends UserInfoState {
  final String error;

  const UserInfoFailure(this.error);
}

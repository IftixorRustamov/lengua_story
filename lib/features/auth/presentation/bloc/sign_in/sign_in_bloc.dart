import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_story/features/auth/presentation/bloc/auth_event.dart';
import 'sign_in_state.dart';
import '../../../domain/usecases/sign_in_usecase.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;

  SignInBloc({required this.signInUseCase}) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(SignInLoading());
      try {
        final result = await signInUseCase(
          email: event.email,
          password: event.password,
        );
        emit(SignInSuccess(signInResponseEntity: result));
      } catch (e) {
        emit(SignInFailure(error: e.toString()));
      }
    });
  }
}

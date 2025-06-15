import 'package:bloc/bloc.dart';
import 'package:lingua_story/features/auth/domain/usecases/verify_code_usecase.dart';
import 'package:lingua_story/features/auth/presentation/bloc/auth_event.dart';
import 'package:lingua_story/features/auth/presentation/bloc/verify_code/verify_code_state.dart';

class VerifyCodeBloc extends Bloc<AuthEvent, VerifyCodeState> {
  final VerifyCodeUseCase verifyCodeUseCase;

  VerifyCodeBloc({required this.verifyCodeUseCase}) : super(VerifyCodeInitial()) {
    on<VerifyCodeEvent>((event, emit) async {
      emit(VerifyCodeLoading());

      try {
        final code = await verifyCodeUseCase.call(code: event.code, key: event.key);
        emit(VerifyCodeSuccess(verifyCodeEntity: code));
      } catch (e) {
        emit(VerifyCodeFailure(error: e.toString()));
      }
    });
  }
}

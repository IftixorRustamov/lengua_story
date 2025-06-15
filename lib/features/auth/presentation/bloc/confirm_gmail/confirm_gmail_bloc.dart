import 'package:bloc/bloc.dart';
import 'package:lingua_story/features/auth/domain/usecases/email_cof_usecase.dart';
import 'package:lingua_story/features/auth/presentation/bloc/auth_event.dart';
import 'package:lingua_story/features/auth/presentation/bloc/confirm_gmail/confirm_gmail_state.dart';

class EmailConfirmationBloc extends Bloc<AuthEvent, EmailConfirmationState> {
  final EmailConfirmationUseCase emailConfirmationUseCase;

  EmailConfirmationBloc({required this.emailConfirmationUseCase})
    : super(EmailConfirmationInitial()) {
    on<EmailConfEvent>((event, emit) async {
      emit(EmailConfirmationLoading());

      try {
        final email = await emailConfirmationUseCase.call(email: event.email);
        emit(EmailConfirmationSuccess(emailConfEntity: email));
      } catch (e) {
        emit(EmailConfirmationFailure(error: e.toString()));
      }
    });
  }
}

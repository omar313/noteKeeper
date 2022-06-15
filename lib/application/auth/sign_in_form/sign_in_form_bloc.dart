import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classpay_new/domain/auth/i_auth_facade.dart';
import 'package:classpay_new/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/auth/auth_failure.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
     await event.map(emailChanged: (e) async {
        emit(state.copyWith(
            emailAddress: EmailAddress(e.emailStr),
            authFailureOrSuccess: null));
      }, passwordChanged: (e) async {
        emit(state.copyWith(
            password: Password(e.passStr), authFailureOrSuccess: null));
      }, registerWithEmailAndPasswordPressed: (e)  async{
        await _performActionOnAuthFacadeWithEmailAndPassword(
            emit, _authFacade.registerWithEmailAndPassword);
      }, signInWithEmailAndPasswordPressed: (e) async {
      await _performActionOnAuthFacadeWithEmailAndPassword(
            emit, _authFacade.signWithEmailAndPassword);
      }, signInWithGooglePressed: (e) async {
        emit(state.copyWith(authFailureOrSuccess: null, isSubmitting: true));
        final result = await _authFacade.signInWithGoogle();
        emit(state.copyWith(authFailureOrSuccess: result, isSubmitting: false));
      });
    });
  }

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
      Emitter<SignInFormState> emit,
      Future<Either<AuthFailure, Unit>> Function(
              {required EmailAddress emailAddress, required Password password})
          forwardCall) async {
    Either<AuthFailure, Unit>? result;
    final isValidEmail = state.emailAddress.isValid;
    final isValidPassword = state.password.isValid;

    if (isValidEmail && isValidPassword){
      emit(state.copyWith(isSubmitting: true, authFailureOrSuccess: null));
      result = await forwardCall(
          emailAddress: state.emailAddress, password: state.password);

    }

    emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccess: result,
        showErrorMessages: true));
  }


}

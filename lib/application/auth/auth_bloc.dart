import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classpay_new/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) {
      event.map(authCheckRequested: (e) async {
        final user = await _authFacade.getSignInUser();
        if (user == null) {
          emit(const AuthState.unAuthenticated());
        } else {
          emit(const AuthState.authenticated());
        }
      }, signedOut: (e) async {
        await _authFacade.signOut();
        emit(const AuthState.unAuthenticated());
      });
    });
  }
}

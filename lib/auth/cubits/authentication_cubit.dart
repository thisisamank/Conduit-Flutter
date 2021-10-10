import 'package:bloc/bloc.dart';
import 'package:conduit_flutter/auth/models/users.dart';
import 'package:conduit_flutter/auth/provider/auth_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._authProvider)
      : super(const AuthenticationState.initial());

  final AuthProvider _authProvider;
  Future<void> login({
    required String email,
    required String password,
  }) async {
    final results = await _authProvider.login(
      email: email,
      password: password,
    );
    results.fold(
      (user) => emit(AuthenticationState.authenticated(user)),
      (failure) => emit(
        AuthenticationState.failure(
          failure.map(
            storage: (message) => "Storage error, please try again!",
            network: (message) => message.error,
          ),
        ),
      ),
    );
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final results = await _authProvider.signUp(
      username: username,
      email: email,
      password: password,
    );
    results.fold(
      (user) => emit(AuthenticationState.authenticated(user)),
      (failure) => emit(
        AuthenticationState.failure(
          failure.map(
            storage: (message) => "Storage error, please try again!",
            network: (message) => message.error,
          ),
        ),
      ),
    );
  }

  Future<void> getCurrentUser() async {
    await _authProvider.isUserSignedIn()
        ? emit(AuthenticationState.authenticated(
            (await _authProvider.getCurrentUser())!))
        : emit(const AuthenticationState.unauthenticated());
  }
}

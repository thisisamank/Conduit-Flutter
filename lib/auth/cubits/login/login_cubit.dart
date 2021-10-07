import 'package:bloc/bloc.dart';
import 'package:conduit_flutter/auth/models/users.dart';
import 'package:conduit_flutter/auth/provider/auth_provider.dart';
import 'package:conduit_flutter/shared/models/conduit_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit(this._authProvider) : super(const AuthState.initial());

  final AuthProvider _authProvider;
  Future<void> login({
    required String email,
    required String password,
  }) async {
    final results = await _authProvider.login(email: email, password: password);
    results.fold(
      (user) => emit(AuthState.success(user)),
      (failure) => emit(const AuthState.failure()),
    );
  }

  // void checkAuthState()  {
  //   _authProvider.isUserSignedIn()
  // }

  Future<void> getCurrentUser() async {
    await _authProvider.isUserSignedIn()
        ? emit(AuthState.success((await _authProvider.getCurrentUser())!))
        : emit(const AuthState.unauthenticated());
  }
}

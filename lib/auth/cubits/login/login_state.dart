part of 'login_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.success(User user) = _Success;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.failure([ConduitError? error]) = _Failure;
}

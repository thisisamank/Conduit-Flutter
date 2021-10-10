import 'package:conduit_flutter/shared/models/conduit_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.storage() = _Storage;
  const factory AuthFailure.network([String? error]) = _Network;
}

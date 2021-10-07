// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  _Storage storage() {
    return const _Storage();
  }

  _Network network([ConduitError? error]) {
    return _Network(
      error,
    );
  }
}

/// @nodoc
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() storage,
    required TResult Function(ConduitError? error) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? storage,
    TResult Function(ConduitError? error)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? storage,
    TResult Function(ConduitError? error)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Storage value) storage,
    required TResult Function(_Network value) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Storage value)? storage,
    TResult Function(_Network value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Storage value)? storage,
    TResult Function(_Network value)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class _$StorageCopyWith<$Res> {
  factory _$StorageCopyWith(_Storage value, $Res Function(_Storage) then) =
      __$StorageCopyWithImpl<$Res>;
}

/// @nodoc
class __$StorageCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$StorageCopyWith<$Res> {
  __$StorageCopyWithImpl(_Storage _value, $Res Function(_Storage) _then)
      : super(_value, (v) => _then(v as _Storage));

  @override
  _Storage get _value => super._value as _Storage;
}

/// @nodoc

class _$_Storage implements _Storage {
  const _$_Storage();

  @override
  String toString() {
    return 'AuthFailure.storage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Storage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() storage,
    required TResult Function(ConduitError? error) network,
  }) {
    return storage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? storage,
    TResult Function(ConduitError? error)? network,
  }) {
    return storage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? storage,
    TResult Function(ConduitError? error)? network,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Storage value) storage,
    required TResult Function(_Network value) network,
  }) {
    return storage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Storage value)? storage,
    TResult Function(_Network value)? network,
  }) {
    return storage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Storage value)? storage,
    TResult Function(_Network value)? network,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(this);
    }
    return orElse();
  }
}

abstract class _Storage implements AuthFailure {
  const factory _Storage() = _$_Storage;
}

/// @nodoc
abstract class _$NetworkCopyWith<$Res> {
  factory _$NetworkCopyWith(_Network value, $Res Function(_Network) then) =
      __$NetworkCopyWithImpl<$Res>;
  $Res call({ConduitError? error});
}

/// @nodoc
class __$NetworkCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$NetworkCopyWith<$Res> {
  __$NetworkCopyWithImpl(_Network _value, $Res Function(_Network) _then)
      : super(_value, (v) => _then(v as _Network));

  @override
  _Network get _value => super._value as _Network;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Network(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ConduitError?,
    ));
  }
}

/// @nodoc

class _$_Network implements _Network {
  const _$_Network([this.error]);

  @override
  final ConduitError? error;

  @override
  String toString() {
    return 'AuthFailure.network(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Network &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$NetworkCopyWith<_Network> get copyWith =>
      __$NetworkCopyWithImpl<_Network>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() storage,
    required TResult Function(ConduitError? error) network,
  }) {
    return network(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? storage,
    TResult Function(ConduitError? error)? network,
  }) {
    return network?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? storage,
    TResult Function(ConduitError? error)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Storage value) storage,
    required TResult Function(_Network value) network,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Storage value)? storage,
    TResult Function(_Network value)? network,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Storage value)? storage,
    TResult Function(_Network value)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _Network implements AuthFailure {
  const factory _Network([ConduitError? error]) = _$_Network;

  ConduitError? get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$NetworkCopyWith<_Network> get copyWith =>
      throw _privateConstructorUsedError;
}

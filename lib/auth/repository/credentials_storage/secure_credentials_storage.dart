import 'package:conduit_flutter/auth/models/users.dart';
import 'package:conduit_flutter/auth/repository/credentials_storage/credentials_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCredentialsStorage implements CredentialsStorage {
  SecureCredentialsStorage(this._storage);
  final FlutterSecureStorage _storage;
  User? _cachedUser;
  static const _userKey = 'user_data';
  @override
  Future<void> clear() {
    _cachedUser = null;
    return _storage.delete(key: _userKey);
  }

  @override
  Future<User?> read() async {
    if (_cachedUser != null) {
      return _cachedUser;
    }
    final userJson = await _storage.read(key: _userKey);
    if (userJson == null) {
      return null;
    }
    try {
      return _cachedUser = User.fromRawJson(userJson);
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> save(User user) {
    _cachedUser = user;
    return _storage.write(key: _userKey, value: user.toRawJson());
  }
}

// flutter pub run build_runner watch --delete-conflicting-outputs
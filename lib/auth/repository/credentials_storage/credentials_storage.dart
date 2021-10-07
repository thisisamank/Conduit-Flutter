import 'package:conduit_flutter/auth/models/users.dart';

abstract class CredentialsStorage {
  Future<User?> read();
  Future<void> save(User user);
  Future<void> clear();
}

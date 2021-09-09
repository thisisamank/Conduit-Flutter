import 'dart:convert';

import 'package:conduit_flutter/shared/models/users.dart';
import 'package:conduit_flutter/shared/repository/service.dart';
import 'package:dio/dio.dart';

class UserRegistrationRepository extends Service<Map<String, dynamic>, bool> {
  UserRegistrationRepository(this.baseUrl);
  static const _requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
  final String baseUrl;

  @override
  Future<bool> post({required Map<String, dynamic> input}) async {
    final dio = Dio();
    dio.options.baseUrl = baseUrl;

    final response = await dio.post('/users', data: jsonEncode(input));
    print(response.statusCode);
    print(response.extra);
    print(response.data);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}

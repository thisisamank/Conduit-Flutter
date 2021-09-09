import 'package:conduit_flutter/shared/repository/user_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mockRegistration = {
      "user": {
        "username": "test1232",
        "email": "test212@gmail.com",
        "password": "1234567"
      }
    };
    UserRegistrationRepository('http://node-express-conduit.appspot.com/')
        .post(input: mockRegistration);
    return MaterialApp(
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}

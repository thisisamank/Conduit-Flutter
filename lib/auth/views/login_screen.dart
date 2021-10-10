import 'package:conduit_flutter/auth/cubits/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                controller: _emailController,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "password",
                ),
                controller: _passwordController,
              ),
              MaterialButton(
                child: const Text("Login"),
                color: Colors.amber,
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    context.read<AuthenticationCubit>().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

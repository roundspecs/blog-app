import 'package:flutter/material.dart';
import 'package:flutter_app/features/auth/presentation/screens/signup_page.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints.loose(const Size(300, double.infinity)),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'username',
                  ),
                  controller: _usernameController,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'password',
                  ),
                  obscureText: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => context.go(SignupPage.route),
                  child: const Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

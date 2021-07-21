import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waco_test/src/pages/signup.dart';
import 'package:waco_test/src/services/authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              icon: Icon(Icons.login),
              label: Text('Registrarse')),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
              },
              child: Text('Sign in'))
        ],
      ),
    );
  }
}

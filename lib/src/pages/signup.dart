import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waco_test/components/button.dart';
import 'package:waco_test/components/input_style.dart';
import 'package:waco_test/core/services/authentication_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Sign in'),
        backgroundColor: Colors.transparent,
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 50.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/waco_logo.png"),
                    height: 65.0,
                  ),
                  SizedBox(height: 80.0),
                  Text('Sign up to Waco Services',
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter an email';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                      validator: (val) => val.length < 6
                          ? 'Enter a password with at least 6 char'
                          : null,
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
                      obscureText: true,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password')),
                  SizedBox(height: 20.0),
                  RaisedGradientButton(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    gradient: LinearGradient(
                        colors: <Color>[Color(0xFF00ff68), Color(0xFF00e6e3)]),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          Navigator.pop(context);
                          context.read<AuthenticationService>().signUp(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim());
                        }
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(text: 'You have an account? '),
                                    TextSpan(
                                        text: 'Sign in to Waco',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

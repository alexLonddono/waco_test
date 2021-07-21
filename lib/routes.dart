import 'package:flutter/material.dart';
import 'package:waco_test/src/pages/editProduct.dart';
import 'package:waco_test/src/pages/home.dart';
import 'package:waco_test/src/pages/signin.dart';
import 'package:waco_test/src/pages/signup.dart';

Map<String, WidgetBuilder> rutasApp() => <String, WidgetBuilder>{
      '/singIn': (BuildContext context) => SignInPage(),
      '/singUp': (BuildContext context) => SignUpPage(),
      '/home': (BuildContext context) => HomePage(),
      '/detail': (BuildContext context) => EditProduct(),
    };

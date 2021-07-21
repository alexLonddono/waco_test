import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waco_test/core/providers/product_provider.dart';
import 'package:waco_test/src/pages/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

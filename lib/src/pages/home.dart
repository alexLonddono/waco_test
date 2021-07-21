import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waco_test/src/services/authentication_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final products = Provider.of<List<Product>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
              icon: Icon(Icons.login),
              label: Text('Cerrar sesión')),
        ],
      ),
      body: Text('Hey'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/detail');
        },
      ),
    );
  }
}

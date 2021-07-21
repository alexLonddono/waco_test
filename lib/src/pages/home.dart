import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waco_test/core/models/productModel.dart';
import 'package:waco_test/core/providers/product_provider.dart';
import 'package:waco_test/src/pages/editProduct.dart';
import 'package:waco_test/core/services/authentication_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

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
      body: StreamBuilder<List<Product>>(
          stream: productProvider.product,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: Icon(Icons.edit),
                    title: Text(snapshot.data[index].name),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProduct(
                                product: snapshot.data[index],
                              )));
                    },
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/detail');
        },
      ),
    );
  }
}

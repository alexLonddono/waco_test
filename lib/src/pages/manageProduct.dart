import 'package:flutter/material.dart';
import 'package:waco_test/core/models/productModel.dart';

class ManageProduct extends StatelessWidget {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final stockController = TextEditingController();
  final priceController = TextEditingController();

  final Product? product;

  ManageProduct({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.login),
              label: Text('Cerrar sesión')),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Product name'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: 'Description'),
          ),
          TextField(
            controller: stockController,
            decoration: InputDecoration(hintText: 'Stock'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(hintText: 'Price'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Agregar')),
              SizedBox(height: 10.0),
              (product != null)
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {},
                      child: Text('Eliminar'))
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}

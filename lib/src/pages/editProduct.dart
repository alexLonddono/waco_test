import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waco_test/core/models/productModel.dart';
import 'package:waco_test/core/providers/product_provider.dart';

class EditProduct extends StatefulWidget {
  final Product? product;

  EditProduct([this.product]);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final stockController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    stockController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.product == null) {
      //New Record
      nameController.text = '';
      descriptionController;
      stockController.text = '';
      priceController.text = '';
      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(Product());
      });
    } else {
      //Controller Update
      // nameController.text = widget.product.name.toString();
      // descriptionController.text = widget.product.description.toString();
      // stockController.text = widget.product.stock.toString();
      // priceController.text = widget.product.price.toString();
      //State Update
      new Future.delayed(Duration.zero, () {
        final productProvider = Provider.of(context, listen: false);
        productProvider.loadValues(widget.product);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Product name'),
              onChanged: (value) {
                productProvider.changeName(value);
              }),
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
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {},
                  child: Text('Eliminar')),
            ],
          )
        ],
      ),
    );
  }
}

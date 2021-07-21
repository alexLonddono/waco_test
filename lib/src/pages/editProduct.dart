import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waco_test/core/models/productModel.dart';
import 'package:waco_test/core/providers/product_provider.dart';

class EditProduct extends StatefulWidget {
  final Product product;

  EditProduct({this.product});

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
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    if (widget.product != null) {
      // Edit
      nameController.text = widget.product.name;
      descriptionController.text = widget.product.description;
      stockController.text = widget.product.stock.toString();
      priceController.text = widget.product.price.toString();

      productProvider.loadAll(widget.product);
    } else {
      // Add
      productProvider.loadAll(null);
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
            onChanged: (String value) => productProvider.changeName = value,
            controller: nameController,
            decoration: InputDecoration(hintText: 'Product name'),
          ),
          TextField(
            onChanged: (String value) =>
                productProvider.changeDescription = value,
            controller: descriptionController,
            decoration: InputDecoration(hintText: 'Description'),
          ),
          TextField(
            onChanged: (String value) => productProvider.changeStock = value,
            controller: stockController,
            decoration: InputDecoration(hintText: 'Stock'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            onChanged: (String value) => productProvider.changePrice = value,
            controller: priceController,
            decoration: InputDecoration(hintText: 'Price'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    productProvider.saveProduct();
                    Navigator.of(context).pop();
                  },
                  child: Text('Agregar')),
              SizedBox(height: 10.0),
              (widget.product != null)
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        productProvider.removeProduct(widget.product.id);
                        Navigator.of(context).pop();
                      },
                      child: Text('Eliminar'))
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}

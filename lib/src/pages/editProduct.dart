import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waco_test/components/button.dart';
import 'package:waco_test/components/input_style.dart';
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

  final _formKey = GlobalKey<FormState>();

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
      appBar: (widget.product != null)
          ? AppBar(
              title: Text('Update product'),
              backgroundColor: Colors.black,
              elevation: 0.0,
              actions: [],
            )
          : AppBar(
              title: Text('Add product'),
              backgroundColor: Colors.black,
              elevation: 0.0,
              actions: [],
            ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 50.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onChanged: (String value) =>
                          productProvider.changeName = value,
                      controller: nameController,
                      style: TextStyle(color: Colors.white),
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Product name',
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      onChanged: (String value) =>
                          productProvider.changeDescription = value,
                      controller: descriptionController,
                      style: TextStyle(color: Colors.white),
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Description',
                      ),
                      minLines: 6,
                      maxLines: 10,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a stock number';
                        }
                        return null;
                      },
                      onChanged: (String value) =>
                          productProvider.changeStock = value,
                      controller: stockController,
                      style: TextStyle(color: Colors.white),
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Stock',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        return null;
                      },
                      onChanged: (String value) =>
                          productProvider.changePrice = value,
                      controller: priceController,
                      style: TextStyle(color: Colors.white),
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Price',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (widget.product != null)
                            ? RaisedGradientButton(
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                gradient: LinearGradient(colors: <Color>[
                                  Color(0xFF00ff68),
                                  Color(0xFF00e6e3)
                                ]),
                                onPressed: () {
                                  setState(() {
                                    if (_formKey.currentState.validate()) {
                                      productProvider.saveProduct();
                                      Navigator.of(context).pop();
                                    }
                                  });
                                },
                              )
                            : RaisedGradientButton(
                                child: Text(
                                  'Add',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                gradient: LinearGradient(colors: <Color>[
                                  Color(0xFF00ff68),
                                  Color(0xFF00e6e3)
                                ]),
                                onPressed: () {
                                  setState(() {
                                    if (_formKey.currentState.validate()) {
                                      productProvider.saveProduct();
                                      Navigator.of(context).pop();
                                    }
                                  });
                                },
                              ),
                        SizedBox(height: 20.0),
                        (widget.product != null)
                            ? RaisedGradientButton(
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                gradient: LinearGradient(colors: <Color>[
                                  Color(0xFF00ff68),
                                  Color(0xFF00e6e3)
                                ]),
                                onPressed: () {
                                  productProvider
                                      .removeProduct(widget.product.id);
                                  Navigator.of(context).pop();
                                },
                              )
                            : Container(),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

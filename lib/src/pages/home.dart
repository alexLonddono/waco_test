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
        title: Text('Waco Products'),
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
              label: Text('Sign out')),
        ],
      ),
      body: Container(
        //padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 50.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
        ),
        child: StreamBuilder<List<Product>>(
            stream: productProvider.product,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Card(child: Text(''));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Center(
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: Card(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 16.0),
                                  color: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 4.0, color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProduct(
                                                      product:
                                                          snapshot.data[index],
                                                    )));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Wrap(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot.data[index].name,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 5.0),
                                                    Text(
                                                      snapshot.data[index]
                                                          .description,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                    SizedBox(height: 10.0),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              children: [
                                                                TextSpan(
                                                                    text: snapshot
                                                                        .data[
                                                                            index]
                                                                        .price
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16)),
                                                                TextSpan(
                                                                    text:
                                                                        ' COP',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold))
                                                              ]),
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        'Stock: ',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                TextSpan(
                                                                    text: snapshot
                                                                        .data[
                                                                            index]
                                                                        .stock
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16)),
                                                              ]),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )));
                    });
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(Icons.add),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: <Color>[Color(0xFF00ff68), Color(0xFF00e6e3)]),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/detail');
        },
      ),
    );
  }
}

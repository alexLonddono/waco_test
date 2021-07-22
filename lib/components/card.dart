import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key key,
    @required this.name,
    @required this.description,
    @required this.stock,
    @required this.price,
  }) : super(key: key);

  final String name;
  final String description;
  final int stock;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 4.0, color: Colors.white),
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          this.description,
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: this.price.toString(),
                                        style: TextStyle(fontSize: 16)),
                                    TextSpan(
                                        text: ' COP',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: 'Stock: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: this.stock.toString(),
                                        style: TextStyle(fontSize: 16)),
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
    );
  }
}

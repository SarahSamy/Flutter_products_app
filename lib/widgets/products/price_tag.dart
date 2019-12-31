import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget{
 final String price;

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {

    return   Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      // '\$${products[index]['price'].toString()}',
                      '\$${price}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  );
               
  }

}
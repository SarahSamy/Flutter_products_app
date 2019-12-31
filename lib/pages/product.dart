import 'package:first_app/models/product.dart';
import 'package:first_app/widgets/products/address_tag.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './../widgets/ui_elements/title_default.dart';
import './../widgets/products/address_tag.dart';
import '../widgets/products/price_tag.dart';

import '../scoped_models/products.dart';

class ProductPage extends StatelessWidget {
  // final String title;
  // final String imageUrl;
  // final String description;
  // final double price;
  final productIndex;

  // ProductPage(this.title, this.imageUrl, this.description, this.price);
  ProductPage(this.productIndex);

  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AddressTag('Union Square,San Francicso'),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        PriceTag(price.toString())
      ],
    );
  }

  // _showWarningDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Are you sure'),
  //           content: Text('This action cannot be undone!'),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text('DISCARD'),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             FlatButton(
  //               child: Text('CONTINUE'),
  //               onPressed: () {
  //                 Navigator.pop(context); //kda ana b2fl al dialog
  //                 Navigator.pop(context,
  //                     true); // kda ana bb3at true f yms7 al saf7a ally ably
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<ProductsModel>(builder:(BuildContext context,Widget child,ProductsModel model){
        final Product product= model.products[productIndex];
        return  Scaffold(
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.white),
            title: Text(
              product.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(product.image),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TitleDefault(product.title),
              ),
              SizedBox(
                height: 10,
              ),
              _buildAddressPriceRow(product.price),
              Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(product.description),
              ),
              // Container(
              //   padding: EdgeInsets.all(10.0),
              //   child: RaisedButton(
              //     child: Text('Delete'),
              //     onPressed: () => _showWarningDialog(context),
              //     color: Colors.redAccent,
              //   ),
              // ),
            ],
            //   ),
          ));
      }),
    );
  }
}

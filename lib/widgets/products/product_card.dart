import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './price_tag.dart';
import './../ui_elements/title_default.dart';
import './address_tag.dart';
import '../../models/product.dart';
import '../../scoped_models/products.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(product.title),
            SizedBox(
              width: 8,
            ),
            PriceTag(product.price.toString()),
          ],
        ));
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.info),
            color: Theme.of(context).accentColor,
            iconSize: 30,
            onPressed: () => Navigator.pushNamed<bool>(
                context, '/product/' + productIndex.toString())
            // .then((bool value) {
            //   if (value) {
            //     print(value);
            //     // deleteProduct(index);
            //   }
            // }),
            ),
        ScopedModelDescendant<ProductsModel>(
            builder: (BuildContext context, Widget child, ProductsModel model) {
          return IconButton(
            icon: !model.products[productIndex].isFavourite ? Icon(
              Icons.favorite_border,
              size: 30,
            ): Icon(
              Icons.favorite,
              size: 30,
            ),
            color: Colors.red,
            onPressed: () {
              model.selectProduct(productIndex);
              model.toggleProductFavouriteStatus();
            },
          );
        })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildTitlePriceRow(),
          AddressTag('Union Square,San Francicso'),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}

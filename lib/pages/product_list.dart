import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './product_edit.dart';
import '../models/product.dart';
import '../scoped_models/products.dart';

class ProductListPage extends StatelessWidget {
  // final List<Product> products;
  // final Function updateProduct;
  // final Function deleteProduct;

  // ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildEditButton(BuildContext context, int index) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      return IconButton(
        icon: Icon(
          Icons.edit,
        ),
        onPressed: () {
          model.selectProduct(index);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage(
                  );
                  //product: products[index], productIndex: index
            },
          ));
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
      return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, ProductsModel model) {
          return ListView.builder(
      itemBuilder: (BuildContext context, int index) {

        return Dismissible(
            key: Key(model.products[index].title),  //hna fy far2 ben model.products[index] w model.selectedProduct ana mogrd b3rd product 7sab al index bta3o msh b3ml select l product
            background: Container(color: Colors.orange[100]),
            onDismissed: (DismissDirection direction) {
                      model.selectProduct(index);
              if (direction == DismissDirection.endToStart) {
                // _showWarningDialog(context);
                model.deleteProduct();
              }
            },
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(model.products[index].image),
                  ),
                  title: Text(model.products[index].title),
                  subtitle: Text('\$${model.products[index].price.toString()}'), //model.selectedProduct.price.toString() tl3 error l2n momkn ykon al selectedProduct b null
                  trailing: _buildEditButton(context, index),
                ),
                Divider()
              ],
            ));
      },
      itemCount: model.products.length,
    );
        });
    
  }
}

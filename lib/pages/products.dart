import 'package:flutter/material.dart';

import '../widgets/products/products.dart';

import '../models/product.dart';
//import './products_admin.dart';

class ProductsPage extends StatelessWidget {
  // final List<Product> products;
  // final Function addProduct;
  // final Function deleteProduct;

  // ProductsPage(this.products, this.addProduct, this.deleteProduct);
  // ProductsPage(this.products);
Widget _buildSideDrawer(BuildContext context){
  return  Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading:
                    false, // kda ana shilt al hamburger button mn gnb 'Choose'
                title: Text('Choose'),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Manage Products'),
                onTap: () {
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>ProductAdminPage()));
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              )
            ],
          ),
        );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:_buildSideDrawer(context),
        appBar: AppBar(
          iconTheme: new IconThemeData(
              color: Colors.white), //to change hamburger icon color
          title: Text(
            'My Products',
            style: TextStyle(color: Colors.white), // to change text color
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {},
            ),
          ],
        ),
        body: Products());
    // ProductManager(this.products, this.addProduct, this.deleteProduct));
  }
}

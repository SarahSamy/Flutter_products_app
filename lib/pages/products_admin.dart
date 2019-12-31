import 'package:flutter/material.dart';

//import './products.dart';
import './product_edit.dart';
import './product_list.dart';
import '../models/product.dart';

class ProductAdminPage extends StatelessWidget {
  // final Function addProduct;
  // final Function updateProduct;
  // final Function deleteProduct;
  // final List<Product> products;


  // ProductAdminPage(this.addProduct,this.updateProduct, this.deleteProduct, this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading:
                false, // kda ana shilt al hamburger button mn gnb 'Choose'
            title: Text('Choose'),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(15),
            leading: Icon(Icons.shop),
            title: Text('All Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => ProductsPage()));
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: _buildSideDrawer(context),
          appBar: AppBar(
            iconTheme: new IconThemeData(
              color: Colors.white),
            title: Text(
              'Manage Products',
              style: TextStyle(color: Colors.white),
            ),
            bottom: TabBar(
              labelColor:Colors.white,
              indicatorColor:Colors.white ,
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.create,
                  ),
                  text: 'Create Product',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'My Products',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ProductEditPage(), 
              // ProductListPage(products,updateProduct,deleteProduct) //mknsh ynf3 ab3at al updateProduct l 'ProductEditPage' l2n 'ProductEditPage' m3mola bs 34an tft7 al create , f bb3t al update hna ll 'ProductListPage' 34an y3ml reload l saf7t al edit
             ProductListPage()
            ],
          )),
    );
  }
}

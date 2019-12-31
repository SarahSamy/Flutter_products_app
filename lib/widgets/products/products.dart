import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

//import './pages/product.dart';
import './product_card.dart';
import '../../models/product.dart';
import '../../scoped_models/products.dart';


class Products extends StatelessWidget {
  //final List<Product> products;
  // final Function deleteProduct;
  // Products(this.products,{this.deleteProduct});

   Widget _buildProductList(List<Product> products) {
    print('products widget build()');
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        // _buildProductItem, // contains a method which defines what is building in item mean
        itemCount: products.length, //numbers of items will be built
      );
    } else {
      productCard = Center(
        child: Text('No Products found,Please add some'),
      );
    }
    return productCard;
  }

  // Products(this.products);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(builder:(BuildContext context,Widget child ,ProductsModel model){
      return _buildProductList(model.products);
    }) ;
  }

 

//for better performance we use 'ListView.builder' that load only the element is being shown and destroy the others
//3mltlha comment 34an gwaha satr wa7ed momkn ytnfz 3la tol
  // Widget _buildProductItem(BuildContext context, int index) {
  //   return ProductCard(products[index], index);
  // }
}

//Navigator.push<bool>(
//   context,
//   MaterialPageRoute(
//       builder: (BuildContext context) => ProductPage(
//           products[index]['title'], products[index]['image'])),
// )

// class Products extends StatelessWidget{
//   final List<String> products;
//   Products(this.products);
//   @override
//   Widget build(BuildContext context) {
//     return   ListView(
//               children: products
//                   .map(
//                     (element) => Card(
//                       margin: EdgeInsets.all(15.0),
//                       child: Column(
//                         children: <Widget>[
//                           Image.asset('assets/foods.jpg'),
//                           Text(element)
//                         ],
//                       ),
//                     ),
//                   )
//                   .toList(),
//             );
//   }

// class Products extends StatelessWidget {
//   final List<String> products;
//   Products(this.products);
//   @override
//   Widget build(BuildContext context) {
//     return products.length >0 ? ListView.builder(
//       itemBuilder:
//           _buildProductItem, // contains a method which defines what is building in item mean
//       itemCount: products.length, //numbers of items will be built
//     )
//     : Center(child: Text('No Products found,Please add some') ,);
//   }

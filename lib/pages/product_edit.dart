import 'package:first_app/scoped_models/products.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../scoped_models/products.dart';

class ProductEditPage extends StatefulWidget {
  // final Function addProduct;
  // final Function updateProduct;
  // final Product product;
  // final int productIndex;

  // ProductEditPage(
  //     {this.product, this.productIndex});
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/foods.jpg',
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      initialValue: product == null ? '' : product.title,
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ characters long.';
        }
        // else {
        //   return '';
        // }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField(Product product) {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      initialValue: product == null ? '' : product.description,
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Description is required should be 10+ characters long.';
        }
        //  else {
        //   return '';
        // }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPriceTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Price'),
      initialValue: product == null ? '' : product.price.toString(),
      keyboardType:  TextInputType.numberWithOptions(decimal: true), 
      validator: (String value) {
        if (value.isEmpty || !RegExp(r'[+-]?([0-9]*[.])?[0-9]+').hasMatch(value)) {
          
          return 'Price is required and should be anumber';
        }
        //  else {
        //   return '';
        // }
      },
      inputFormatters: <TextInputFormatter>[ 
        //34an y2bal numbers bs
        WhitelistingTextInputFormatter(RegExp(r"[\d.]"))
        
     ],
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  Widget _buildRaisedButton() {
    //Function addProduct,Function updateProduct
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      return RaisedButton(
        textColor: Colors.white,
        child: Text('Save'),
        onPressed: () => _submitForm(
            model.addProduct, model.updateProduct, model.selectedProductIndex),
      );
    });
  }

  Widget _buildPageContent(BuildContext context, Product product) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    // ScopedModelDescendant<ProductsModel>(
    //     builder: (BuildContext context, Widget child, ProductsModel model) {
    //       Product product=model.products[model.selectedProductIndex];
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            margin: EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
                children: <Widget>[
                  _buildTitleTextField(product),
                  _buildDescriptionTextField(product),
                  _buildPriceTextField(product),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildRaisedButton() //addProduct(product),updateProduct(product)
                  // Text(titleValue)
                ],
              ),
            )));
    // });
  }

  void _submitForm(Function addProduct, Function updateProduct,
      [int selectedProductIndex]) {
    // el kosen dol[] m3nahom 'optional'
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (selectedProductIndex == null) {
      addProduct(Product(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: _formData['image']));
    } else {
      updateProduct(
          Product(
              title: _formData['title'],
              description: _formData['description'],
              price: _formData['price'],
              image: _formData['image']));
    }

    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      // Product product=model.products[model.selectedProductIndex];
      final Widget pageContent =
          _buildPageContent(context, model.selectedProduct);
      return model.selectedProductIndex == null
          ? pageContent
          : Scaffold(
              appBar: AppBar(
                iconTheme: new IconThemeData(color: Colors.white),
                title: Text(
                  'Edit Product',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: pageContent,
            );
    });
  }
}

// child: Text('Create a product'),
// RaisedButton(
//         child: Text('Save'),
//         onPressed: () {
//           showModalBottomSheet(
//               context: context,
//               builder: (BuildContext context) {
//                 return Center(
//                   child: Text(
//                     'This is a Modal !',
//                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
//                   ),
//                 );
//               });
//         },
//       ),

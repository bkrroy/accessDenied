import 'dart:collection';

import 'package:fem_bizz/screens/SellerScreens/States/sellerProductsWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class ProductListView extends ChangeNotifier{
  List<Widget> _productList = [
    AddProductWidget(),
  ];

  UnmodifiableListView<Widget> get productList {
    return UnmodifiableListView(_productList);
  }

  int get productCount{
    notifyListeners();
    return _productList.length;
  }

  void addProductToList() {
    _productList.add(ProductInformationWidget(
      name: _name,
      price: _price,
      stock: _stock,
      file: _file,
    ));
    notifyListeners();
  }


  File _file;

  Future<void> getImagePath() async{
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    _file = File(pickedFile.path);

    print(_file.toString());
  }

  bool isFileNull(){
    if(_file == null)
      return true;
    else return false;
  }

  File getFIlePath() {
    return _file;
  }

  String _price;
  String _name;
  String _stock;

  Future<void> getProductInfo({String price, String name, String stock}) async{
    _price = price;
    _name = name;
    _stock = stock;

    print(_price);
  }

  String returnPrice() {
    return _price;
  }

  String returnName() {
    return _name;
  }

  String returnStock() {
    return _stock;
  }



}
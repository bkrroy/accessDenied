import 'package:fem_bizz/product_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class SellerProductsScreenWidget extends StatefulWidget {
  @override
  _SellerProductsScreenWidgetState createState() =>
      _SellerProductsScreenWidgetState();
}

class _SellerProductsScreenWidgetState
    extends State<SellerProductsScreenWidget> {

  @override
  void initState() {
    setState(() {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 28.0),
      itemCount: Provider.of<ProductListView>(context, listen: true).productCount,
      itemBuilder: (BuildContext context, int index) {
        return Provider.of<ProductListView>(context, listen: true).productList[index];
      },
    );
  }
}

/// This is to add product Widget
class AddProductWidget extends StatefulWidget {
  @override
  _AddProductWidgetState createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {
  String name;
  String price;
  String stock;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 335,
          decoration: BoxDecoration(
            color: Color(0xFFFFDADA),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async{
                    await Provider.of<ProductListView>(context, listen:  false).getImagePath();
                    setState(() {

                    });
                  },
                  child: Container(
                      height: 99.2,
                      width: 111.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Provider.of<ProductListView>(context, listen: false).isFileNull() == false ?
                          Image.file(Provider.of<ProductListView>(context, listen: false).getFIlePath()) :
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.file_upload),
                            Text(
                              'Upload Image',
                              style: GoogleFonts.openSans(),
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        width: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            border: InputBorder.none,
                          ),
                          onChanged: (String value){
                            name = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        width: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Price in Rs',
                            border: InputBorder.none,
                          ),
                          onChanged: (String value){
                            price = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        width: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Pieces in Stock',
                            border: InputBorder.none,
                          ),
                          onChanged: (String value){
                            price = value;
                            print(price);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async{
                              await Provider.of<ProductListView>(context, listen:  false).getProductInfo(
                                name: name,
                                price:  price,
                                stock: stock,
                              );
                              Provider.of<ProductListView>(context, listen: false).addProductToList();
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Icon(Icons.add_circle_outline_outlined),
                                  Text(
                                    'Add',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.delete_outlined),
                          Text(
                            'Delete',
                            style: GoogleFonts.openSans(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

/// this is for product information
class ProductInformationWidget extends StatelessWidget {

  ProductInformationWidget({
   this.price,
   this.name,
   this.stock,
    this.file,
});


  final File file;
  final String name;
  final String price;
  final String stock;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 335,
          decoration: BoxDecoration(
            color: Color(0xFFFFDADA),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                    height: 99.2,
                    width: 111.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Image.file(file),
                    )),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.openSans(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Price: Rs $price',
                        style: GoogleFonts.openSans(
                          fontSize: 12.0,
                          color: Color(0xFF888383),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Pieces in stock: $stock',
                        style: GoogleFonts.openSans(
                          fontSize: 12.0,
                          color: Color(0xFF888383),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Pieces sold: 24',
                        style: GoogleFonts.openSans(
                          fontSize: 12.0,
                          color: Color(0xFF888383),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.refresh_outlined),
                          Text(
                            'Update',
                            style: GoogleFonts.openSans(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.delete_outlined),
                          Text(
                            'Delete',
                            style: GoogleFonts.openSans(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerHomeScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today\'s stats',
                style: GoogleFonts.openSans(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ProductInfoDisplyaWidget(
                imagePath: 'images/stocksImage.png',
                buttonName: 'People Viewed',
              ),
              SizedBox(
                height: 30,
              ),
              ProductInfoDisplyaWidget(
                imagePath: 'images/stocksImage.png',
                buttonName: 'People bought',
              ),
              SizedBox(
                height: 30,
              ),
              ProductWithImageDisplayWidget(
                imagePath: 'images/popularProductImage.png',
                buttonName: 'Most Popular\nProduct',
              ),
              SizedBox(
                height: 30,
              ),
              ProductWithImageDisplayWidget(
                imagePath: 'images/dealOfTheDayImage.png',
                buttonName: 'Deal of the \nDay',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductInfoDisplyaWidget extends StatelessWidget {
  ProductInfoDisplyaWidget({
    this.imagePath,
    this.buttonName,
  });

  final String imagePath;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 145,
          width: 145,
          decoration: BoxDecoration(
              color: Color(0xFFFFDADA),
              borderRadius: BorderRadius.circular(14.0)),
          child: Image.asset(imagePath),
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          height: 44.39,
          width: 174,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFFFDADA),
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: Text(
              buttonName,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductWithImageDisplayWidget extends StatelessWidget {
  ProductWithImageDisplayWidget({
    this.imagePath,
    this.buttonName,
  });

  final String imagePath;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 145,
          width: 145,
          decoration: BoxDecoration(
            color: Color(0xFFFFDADA),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Center(
            child: Container(
              height: 75,
              width: 84.07,
              child: Image.asset(imagePath, fit: BoxFit.contain,),
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          height: 44.39,
          width: 174,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFFFDADA),
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: Text(
              buttonName,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

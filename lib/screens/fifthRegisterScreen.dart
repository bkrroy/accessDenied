import 'package:fem_bizz/authentication_service.dart';
import 'package:fem_bizz/screens/log_in.dart';
import 'package:fem_bizz/seller_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fem_bizz/authentication_service.dart';
import 'package:provider/provider.dart';

import 'SellerScreens/sellerHomeScreen.dart';

class FifthRegistrationScreen extends StatefulWidget {
  @override
  _FifthRegistrationScreenState createState() =>
      _FifthRegistrationScreenState();
}

class _FifthRegistrationScreenState extends State<FifthRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 35.94,
                width: 46,
                child: Image.asset(
                  'images/femBizzLogo.png',
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set up your FemBizz\naccount',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      color: Color(0xFFFF6A6A),
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 59,
                    width: 370,
                    child: Image.asset(
                      'images/fifthTimeline.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 324,
                    width: 345,
                    child: Image.asset('images/accountCreatedImage.png'),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () async{
                      String currentEmailId = context.read<AuthenticationService>().returnUserEmailId();
                      Provider.of<SellerInformationService>(context, listen: false).getCurrentEmail(
                        emailID: currentEmailId
                      );
                      await Provider.of<SellerInformationService>(context, listen: false).addSellerInformation();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerHomeScreen()));
                    },
                    child: Container(
                      height: 40,
                      width: 345,
                      decoration: BoxDecoration(
                          color: Color(0xFF002D56),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          'Go To Home Page',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      context.read<AuthenticationService>().signOut();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: Container(
                      height: 40,
                      width: 345,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6A6A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Out',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

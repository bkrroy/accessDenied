import 'package:fem_bizz/screens/log_in.dart';
import 'package:fem_bizz/screens/secondRegisterScreen.dart';
import 'package:fem_bizz/screens/sign_up.dart';
import 'package:fem_bizz/seller_information.dart';
import 'package:flutter/material.dart';
import 'package:fem_bizz/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterFirstUser extends StatefulWidget {
  @override
  _RegisterFirstUserState createState() => _RegisterFirstUserState();
}

class _RegisterFirstUserState extends State<RegisterFirstUser> {
  String firstName;
  String middleName;
  String lastName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                child: Image.asset('images/femBizzLogo.png', ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set up your FemBizz\naccount',
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
                    child: Image.asset('images/firstTimeline.png', fit: BoxFit.fitWidth,),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Have the following available:',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // This for the column with available things
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 25.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AvailableListWidget(
                            textInfo: 'Business name & address',
                            imagePath: 'images/businessImage.png',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          AvailableListWidget(
                            textInfo: 'Mobile or telephone number',
                            imagePath: 'images/phoneImage.png',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          AvailableListWidget(
                            textInfo: 'A chargeable credit card',
                            imagePath: 'images/creditCardImage.png',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          AvailableListWidget(
                            textInfo: 'Tax Information',
                            imagePath: 'images/taxInformation.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Your name',
                    style: GoogleFonts.openSans(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // This Row is to take the input of the user's complete name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // This is for the first name
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'First',
                              border: InputBorder.none,
                            ),
                            onChanged: (String value) {
                              firstName = value;
                              setState(() {
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      // This is for the middle name
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Middle',
                              border: InputBorder.none,
                            ),
                            onChanged: (String value) {
                              middleName = value;
                              setState(() {
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      // This is for the middle name
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Last',
                              border: InputBorder.none,
                            ),
                            onChanged: (String value) {
                              lastName = value;
                              setState(() {
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  /*

                  This is for next an previous button

                   */
                  SizedBox(
                    height: 90,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<AuthenticationService>().signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 162,
                          decoration: BoxDecoration(
                              color: Color(0xFFFF6A6A),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Sign Out',
                              style: GoogleFonts.openSans(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          Provider.of<SellerInformationService>(context, listen: false).enterName(
                            firstName: firstName,
                            middleName: middleName,
                            lastName: lastName,
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondRegisterScreen()));
                        },
                        child: Container(
                          height: 40,
                          width: 162,
                          decoration: BoxDecoration(
                              color: Color(0xFF002D56),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Next',
                              style: GoogleFonts.openSans(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

class AvailableListWidget extends StatelessWidget {
  AvailableListWidget({this.textInfo, this.imagePath});

  final String textInfo;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 32,
          width: 35.5,
          child: Image.asset(imagePath),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          textInfo,
          textAlign: TextAlign.left,
          style: GoogleFonts.openSans(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

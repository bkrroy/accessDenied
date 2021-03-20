import 'package:fem_bizz/screens/thirdRegisterScreen.dart';
import 'package:fem_bizz/seller_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecondRegisterScreen extends StatefulWidget {
  @override
  _SecondRegisterScreenState createState() => _SecondRegisterScreenState();
}

class _SecondRegisterScreenState extends State<SecondRegisterScreen> {
  double dobBoxSpace = 25.0;
  String dd;
  String mm;
  String yyyy;
  String phoneNumber;
  String businessAddress;

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
              padding: const EdgeInsets.only(left: 28.0, right: 13.0),
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
                      'images/secondTimeline.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Personal Information for ${Provider.of<SellerInformationService>(context,listen: false ).returnName()}',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Date of Birth',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  /*
                  This is the input for the Date of Birth
                   */
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        height: 40,
                        width: 93,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'DD',
                            border: InputBorder.none,
                          ),
                          onChanged: (String value){
                            dd = value;
                          },
                        ),
                      ),
                      SizedBox(
                        width: dobBoxSpace,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        height: 40,
                        width: 93,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'MM',
                            border: InputBorder.none,
                          ),
                          onChanged: (String value){
                            mm = value;
                          },
                        ),
                      ),
                      SizedBox(
                        width: dobBoxSpace,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        height: 40,
                        width: 93,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'YYYY',
                            border: InputBorder.none,
                          ),
                          onChanged: (String value){
                            yyyy = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Business Address',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8.0),
                    height: 40,
                    width: 360,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Address',
                        border: InputBorder.none,
                      ),
                      onChanged: (String value){
                        businessAddress = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Phone Number',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8.0),
                    height: 40,
                    width: 360,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter Contact Number',
                        border: InputBorder.none,
                      ),
                      onChanged: (String value){
                        phoneNumber = value;
                      },
                    ),
                  ),
                  /*
                  This is for next and previous button
                   */
                  SizedBox(
                    height: 160,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 162,
                          decoration: BoxDecoration(
                              color: Color(0xFFFF6A6A),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Previous',
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
                          Provider.of<SellerInformationService>(context, listen: false).getDOB(
                            date: dd,
                            month: mm,
                            year: yyyy,
                          );
                          Provider.of<SellerInformationService>(context, listen: false).getPhoneNumberAndAddress(
                            phoneNumber: phoneNumber,
                            address: businessAddress
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdRegisterScreen()));
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

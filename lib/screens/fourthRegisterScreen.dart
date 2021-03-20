import 'package:fem_bizz/screens/thirdRegisterScreen.dart';
import 'package:fem_bizz/seller_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fifthRegisterScreen.dart';
import 'package:provider/provider.dart';

String businessLocation;
String businessType;
String panCardDetails;

class FourthRegisterScreen extends StatefulWidget {
  @override
  _FourthRegisterScreenState createState() => _FourthRegisterScreenState();
}

class _FourthRegisterScreenState extends State<FourthRegisterScreen> {
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
                      'images/fourthTimeline.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Online KYC for store verification',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InformationWidget(
                    topTextInformation: 'Business Location',
                    hintText: 'Choose Location',
                    id: '1',
                  ),
                  InformationWidget(
                    topTextInformation: 'Business Type',
                    hintText: 'Choose Type',
                    id: '2',
                  ),
                  InformationWidget(
                    topTextInformation: 'PAN Card Details',
                    hintText: 'Enter Card Number',
                    id: '3',
                  ),

                  Container(
                    child: Text(
                      'We will confirm all the details via video call.'
                          '\nAll the details of the video call will be shared'
                          '\nthrough email withing 7 working days.',
                      style: GoogleFonts.openSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
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
                          Provider.of<SellerInformationService>(context, listen: false).getBusinessInformation(
                            businessLocation: businessLocation,
                            businessType: businessType,
                            panCard: panCardDetails,
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FifthRegistrationScreen()));
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


class InformationWidget extends StatelessWidget {

  InformationWidget({this.topTextInformation, this.hintText, this.id});

  final String topTextInformation;
  final String hintText;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topTextInformation,
            textAlign: TextAlign.left,
            style: GoogleFonts.openSans(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5,),
          Container(
            padding: EdgeInsets.only(left: 8),
            height: 40,
            width: 360,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              onChanged: (String value){
                if(id == "1"){
                  businessLocation = value;
                } else if (id == "2"){
                  businessType = value;
                } else if(id == "3"){
                  panCardDetails = value;
                }
              },
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

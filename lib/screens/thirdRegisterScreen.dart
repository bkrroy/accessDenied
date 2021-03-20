import 'package:fem_bizz/seller_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fourthRegisterScreen.dart';


String cardNumber;
String cardHolderName;
String validDate;
String accountHolderName;
String bankAccountNumber;
String bankName;
String ifscCode;

class ThirdRegisterScreen extends StatefulWidget {
  @override
  _ThirdRegisterScreenState createState() => _ThirdRegisterScreenState();
}

class _ThirdRegisterScreenState extends State<ThirdRegisterScreen> {

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
                      'images/thirdTimeline.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Set up your billing method',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*
                  This is for the card details and all
                   */
                  InformationWidget(topTextInformation: 'Card Number', hintText: 'Enter Card Number', id: '1',),
                  InformationWidget(topTextInformation: 'Cardholder\'s Name', hintText: 'Enter Cardholder\'s Name', id: '2',),
                  InformationWidget(topTextInformation: 'Valid through', hintText: 'MM/YYYY', id: '3',),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Set up your deposit method',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InformationWidget(topTextInformation: 'Account Holder Name', hintText: 'Enter Account Holder Name', id: '4',),
                  InformationWidget(topTextInformation: 'Bank Account Number', hintText: 'Enter Bank Account Number', id: '5',),
                  InformationWidget(topTextInformation: 'Bank Name', hintText: 'Enter Bank Name', id: '6',),
                  InformationWidget(topTextInformation: 'IFSC Code', hintText: 'Enter IFSC Code', id: '7',),
                  SizedBox(
                    height: 30,
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
                          Provider.of<SellerInformationService>(context, listen: false).getBankInformation(
                            cardNumber: cardNumber,
                            cardHolderName: cardHolderName,
                            validDate: validDate,
                            accountHolderName: accountHolderName,
                            accountNumber: bankAccountNumber,
                            bankName: bankName,
                            ifscCode: ifscCode,
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FourthRegisterScreen()));
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
                  SizedBox(
                    height: 20,
                  )
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


  bool returnKeyboardType(){
    if(id == '1' || id == '5' ){
      return true;
    }
    else
      return false;
  }

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
              keyboardType: returnKeyboardType() == true ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              onChanged: (String value){
                if (id == '1'){
                  cardNumber = value;
                } else if(id == '2'){
                  cardHolderName = value;
                } else if(id == "3"){
                  validDate = value;
                } else if(id == "4"){
                  accountHolderName = value;
                } else if(id == "5"){
                  bankAccountNumber = value;
                } else if(id =="6"){
                  bankName = value;
                } else if(id == "7"){
                  ifscCode = value;
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fem_bizz/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SellerInformationService extends ChangeNotifier{
  SellerInformationService(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  /*
  To take the name of the user
   */
  String _fistName = '';
  String _middleName ='';
  String _lastName = '';

  void enterName({String firstName, String middleName, String lastName}){
    this._fistName = firstName;
    this._middleName = middleName;
    this._lastName = lastName;

    print(this._lastName);

    notifyListeners();
  }

  String returnName(){
    return (this._fistName+" "+this._middleName+" "+this._lastName);
  }
  /*
  end of to get name
   */

  /*
  START
  To get the date of birth
   */

  String _dateOfBirth;

  void getDOB({String date, String month , String year}) {
    this._dateOfBirth = date+'/'+month+'/'+year;
    print(this._dateOfBirth);
  }

  String returnDOB(){
    return this._dateOfBirth;
  }
  /*
  End of getting date of Birth
   */

  /*
  To get the phone number and address
   */
  String _phoneNumber;
  String _address;

  void getPhoneNumberAndAddress({String phoneNumber, String address}){
    this._phoneNumber = phoneNumber;
    this._address = address;
    notifyListeners();

    print(this._phoneNumber);
    print(this._address);
  }

  String returnPhoneNumber(){
    return this._phoneNumber;
  }

  String returnAddress(){
    return this._address;
  }
  /*
  end of getting phone number and address
   */
  /*
  To get bank information details
   */

  String _cardNumber;
  String _cardHolderName;
  String _validDate;
  String _accountHolderName;
  String _accountNumber;
  String _bankName;
  String _ifscCode;

  void getBankInformation({
  String cardNumber,
    String cardHolderName,
    String validDate,
    String accountHolderName,
    String accountNumber,
    String bankName,
    String ifscCode
  }){
    this._cardNumber = cardNumber;
    this._cardHolderName = cardHolderName;
    this._validDate = validDate;
    this._accountHolderName = accountHolderName;
    this._accountNumber = accountNumber;
    this._bankName = bankName;
    this._ifscCode = ifscCode;

    print(this._cardNumber);
    print(this._validDate);
  }


  String returnCardNumber(){
    return this._cardNumber;
  }

  String returnCardHolderName(){
    return this._cardHolderName;
  }

  String returnAccountHolderName(){
    return this._accountHolderName;
  }

  String returnBankName(){
    return this._bankName;
  }

  String returnIFSCCode(){
    return this._ifscCode;
  }

  /*
  to get business information
   */

  String _businessLocation;
  String _businessType;
  String _panCard;

  void getBusinessInformation({String businessLocation, String businessType, String panCard}){
    this._businessLocation = businessLocation;
    this._businessType = businessType;
    this._panCard = panCard;

    print(this._businessType);
  }

  String returnBusinessLocation(){
    return this._businessLocation;
  }

  String returnBusinessType(){
    return this._businessType;
  }

  String returnPanCardDetails(){
    return this._panCard;
  }

  String _currentEmail = '';

  void getCurrentEmail({String emailID}){
    _currentEmail = emailID;
  }


  /// To add all the values to the firestore

  final sellerInfoInstance = FirebaseFirestore.instance;


  Future<void> addSellerInformation() async{
    sellerInfoInstance.collection('SellerInformation').doc(_currentEmail).set(
      {
        "emailId" : _currentEmail,
        "name": _fistName+' '+_middleName+" "+ _lastName,
        "DOB": _dateOfBirth,
        "Business_Address": _address,
        "phoneNumber": _phoneNumber,
        "cardNumber": _cardNumber,
        "cardHolder_Name": _cardHolderName,
        "validThrough": _validDate,
        "accountHolderName": _accountHolderName,
        "accountNumber": _accountNumber,
        "bankName": _bankName,
        "ifscCode": _ifscCode,
        "businessLocation": _businessLocation,
        "businessType": _businessType,
        "panCard": _panCard,
      }
    );
    print("Uploaded");
  }

  Future<void> returnSellerInformation() async{
     var getUser = await sellerInfoInstance.collection('SellerInformation').doc(_currentEmail).get();
     print(getUser.data().keys);
     print(getUser.data().values);
  }
}
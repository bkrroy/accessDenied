import 'package:fem_bizz/screens/SellerScreens/sellerHomeScreen.dart';
import 'package:fem_bizz/screens/intro_screen_one.dart';
import 'package:fem_bizz/screens/registerInfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:fem_bizz/authentication_service.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null){
      return RegisterFirstUser();//SellerHomeScreen();
    }
    else{
      return IntroScreenOne();
    }
  }
}

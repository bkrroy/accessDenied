import 'package:fem_bizz/screens/log_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fem_bizz/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ElevatedButton(
            child: Text('Sign Out'),
            onPressed: (){
              context.read<AuthenticationService>().signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },
          ),
        ),
      ),
    );
  }
}

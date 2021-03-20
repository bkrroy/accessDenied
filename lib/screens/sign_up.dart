import 'package:fem_bizz/screens/log_in.dart';
import 'package:fem_bizz/screens/registerInfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fem_bizz/authentication_service.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null){
      return RegisterFirstUser();
    }

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
                child: Image.asset('images/femBizzLogo.png'),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create an account',
                        style: GoogleFonts.openSans(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Let\'s start scaling \nyour business!',
                        style: GoogleFonts.openSans(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF6A6A)),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Container(
                      height: 127.15,
                      width: 116,
                      child: Image.asset('images/loginWoman.png'),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      height: 50,
                      width: 325,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Your Name', border: InputBorder.none),
                          onChanged: (String value){
                            name = value;
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      height: 50,
                      width: 325,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Email', border: InputBorder.none),
                          onChanged: (String value){
                            email = value;
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      height: 50,
                      width: 325,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          autofocus: false,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Password', border: InputBorder.none),
                          onChanged: (String value){
                            password = value;
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // This is for the sign up page
                    GestureDetector(
                      onTap: (){
                        context.read<AuthenticationService>().signUp(
                          email: email,
                          password: password,
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 325,
                        decoration: BoxDecoration(
                            color: Color(0xFF002D56),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: MediaQuery.of(context).size.height*0.01,),
                    Text(
                      'By continuing you agree to accept our',
                      style: GoogleFonts.openSans(
                          color: Color(0xFF8A8181),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Privacy Policy & Terms of Services',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ?  ',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          },
                          child: Container(
                            child: Text(
                              'Log In',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Color(0xFFFF6A6A),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:fem_bizz/screens/intro_screen_two.dart';
import 'package:fem_bizz/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IntroScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onHorizontalDragUpdate: (details){
            if(details.delta.dx < 0){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroScreenTwo()));
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/onBoardingScreenOne.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 50, ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 337,
                        width: 373.52,
                        child: Image.asset('images/buildWithUS.png', fit: BoxFit.cover,),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'BUILD WITH US',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.openSans(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          'Sell your product globally and \nreach out the people',
                          textAlign: TextAlign.left,
                        style: GoogleFonts.openSans(
                          wordSpacing: 1,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 90,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF6A6A),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFDADA),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFDADA),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //SkipButton
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                            },
                            child: Container(
                              height: 38,
                              width: 86,
                              decoration: BoxDecoration(
                                color: Color(0xFF002D56),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Skip',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

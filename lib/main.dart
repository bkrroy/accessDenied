import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fem_bizz/authentication_service.dart';
import 'package:fem_bizz/product_list_view.dart';
import 'package:fem_bizz/screens/home_page.dart';
import 'package:fem_bizz/screens/intro_screen_one.dart';
import 'package:fem_bizz/screens/startScreen.dart';
import 'package:fem_bizz/seller_information.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async{
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges),
        Provider<SellerInformationService>(
          create: (_) => SellerInformationService(FirebaseFirestore.instance),
        ),
        Provider<ProductListView>(
          create: (_) => ProductListView(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: StartScreen(),
        ),
      ),
    );
  }
}


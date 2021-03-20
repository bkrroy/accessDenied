import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'States/SellerProfileScreenWidget.dart';
import 'States/sellerHomeScreenWidget.dart';
import 'States/sellerInvestmentScreenWidget.dart';
import 'States/sellerProductsWidget.dart';
import 'States/sellerRevenueScreenWidget.dart';

class SellerHomeScreen extends StatefulWidget {
  @override
  _SellerHomeScreenState createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue);
  List<Widget> _widgetOptions = <Widget>[
    SellerHomeScreenWidget(),
    SellerRevenueScreenWidget(),
    SellerInvestmentScreenWidget(),
    SellerProductsScreenWidget(),
    SellerProfileScreenWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 35.94,
          width: 46,
          child: Image.asset('images/femBizzLogo.png'),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/homeIcon.png'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/revenueIcon.png'),
              ),
              label: 'Revenue',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/accountsIcon.png'),
              ),
              label: 'Accounts',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/productIcon.png')),
              label: 'My Products',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/userAccountIcon.png')),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
      body: Container(
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
    );
  }
}









import 'package:fem_bizz/authentication_service.dart';
import 'package:fem_bizz/screens/SellerScreens/States/bar_graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

//TODO: try to implement the bar graph

class SellerRevenueScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Revenue',
                style: GoogleFonts.openSans(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Today\'s income',
                style: GoogleFonts.openSans(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 38,
                width: 148,
                decoration: BoxDecoration(
                  color: Color(0xFFFFDADA),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    '20,000.00',
                    style: GoogleFonts.openSans(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: 350,
                child: BarChartSample2(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Weekly Aggregate',
                style: GoogleFonts.openSans(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 38,
                width: 148,
                decoration: BoxDecoration(
                  color: Color(0xFFFFDADA),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    '1,20,000.00',
                    style: GoogleFonts.openSans(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'History',
                style: GoogleFonts.openSans(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IncomeHistoryWidget(),
              IncomeHistoryWidget(),
              IncomeHistoryWidget(),
              IncomeHistoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class IncomeHistoryWidget extends StatelessWidget {
  const IncomeHistoryWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Text(
            'February, 2021',
            style: GoogleFonts.openSans(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: (){
              context.read<AuthenticationService>().signOut();
            },
            child: Container(
              height: 38,
              width: 148,
              decoration: BoxDecoration(
                color: Color(0xFFFFDADA),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(
                  '4,20,000.00',
                  style: GoogleFonts.openSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

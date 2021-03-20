import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SellerInvestmentScreenWidget extends StatelessWidget {
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
                'Investments',
                style: GoogleFonts.openSans(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Government schemes to invest',
                style: GoogleFonts.openSans(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GovernmentInvestmentWidget(
                headingText: 'Public Providend Fund',
                url: 'https://www.epfindia.gov.in/site_en/index.php',
              ),
              SizedBox(
                height: 40,
              ),
              GovernmentInvestmentWidget(
                headingText: 'Atal Pension Yojna',
                url: 'https://www.npscra.nsdl.co.in/scheme-details.php',
              ),
              SizedBox(
                height: 40,
              ),
              GovernmentInvestmentWidget(
                headingText: 'Mutual Funds',
                url: 'https://www.mutualfundssahihai.com/en',
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GovernmentInvestmentWidget extends StatelessWidget {
  const GovernmentInvestmentWidget({
    this.headingText,
    this.url,
  });

  final String headingText;
  final String url;
  void _launchURL() async {
    await canLaunch(url)
        ? await launch(url)
        : throw 'could not launch Url';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL();
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 8, right: 10, bottom: 10),
        width: 335,
        decoration: BoxDecoration(
          color: Color(0xFFFFDADA),
          borderRadius: BorderRadius.circular(29.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headingText,
              style: GoogleFonts.openSans(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: Text(
                'It is one of the most popular investment options'
                'for low-risk investors. In PPF, you can invest money'
                'ranging from Rs. 500 to 1.5 lakh in a financial year'
                'for a period of maximum 15 years. The Government '
                'of India fixes the interest rate of PPF every quarter.'
                'The most attractive feature of PPF is that your'
                'entire investment amount along with the interest'
                'earned and the maturity amount is totally tax-free',
                style: GoogleFonts.openSans(
                    color: Color(0xFF888383), fontSize: 13.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

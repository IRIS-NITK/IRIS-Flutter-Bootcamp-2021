import 'package:flutter/material.dart';
import 'package:my_portfolio_app/constants/constants.dart';
import 'package:my_portfolio_app/constants/interests.dart';
import 'package:my_portfolio_app/widgets/interest_widget.dart';

class AboutMePage extends StatefulWidget {
  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.3,
        child: Card(
          elevation: 8,
          color: Color(0xFF843b62),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/ikjot.jpg'),
                  radius: 60.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'IKJOT SINGH',
                  style: nameHeadingTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('CSE,NITK', style: cardsHeadingTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Passionate about Flutter App Development',
                    style: aboutMeDescriptionTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Swipe left, to take a peek at my interest :)', style: cardsDescriptionTextStyle)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_portfolio_app/constants/interests.dart';
import 'package:my_portfolio_app/widgets/interest_widget.dart';

class MyInterestsPage extends StatefulWidget {
  @override
  _MyInterestsPageState createState() => _MyInterestsPageState();
}

class _MyInterestsPageState extends State<MyInterestsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        children: [
              for ( var i in interests ) InterestWidget(interest: i,)
        ],
      ),
    );
  }
}
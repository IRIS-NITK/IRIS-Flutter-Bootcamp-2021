import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio_app/constants/constants.dart';

class MyProjectsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color(0xFF621940),
        elevation: 10,
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/engineer.svg',
              height: 40.0,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'My Projects',
              style: cardsHeadingTextStyle,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Click over here to check out my projects on Github!',
              style: cardsDescriptionTextStyle,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}
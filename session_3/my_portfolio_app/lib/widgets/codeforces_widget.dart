import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio_app/constants/constants.dart';

class CodeforcesWidget extends StatelessWidget {
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
          trailing: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/coding.svg',
              height: 40.0,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Codeforces Profile',
              style: cardsHeadingTextStyle,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Pressing here will take you to my CF page.',
              style: cardsDescriptionTextStyle,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}
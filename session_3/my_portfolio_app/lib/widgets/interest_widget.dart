import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio_app/constants/constants.dart';
import 'package:my_portfolio_app/model/Interest.dart';

class InterestWidget extends StatelessWidget {
  final Interest interest;
  InterestWidget({this.interest});
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 100.0,
    //   width: MediaQuery.of(context).size.width / 1.1,
    //   child: Card(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //       ),
    //       color: Color(0xFF843b62),
    //       child: Row(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: SvgPicture.asset(
    //               interest.interestImgPath,
    //               height: 40.0,
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Text(
    //                     interest.interest,
    //                     style: cardsHeadingTextStyle,
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(left:8.0),
    //                   child: Text(
    //                     interest.interestDescription,
    //                     style: cardsDescriptionTextStyle,
    //                     overflow: TextOverflow.fade,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       )),
    // );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color(0xFF843b62),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          trailing: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              interest.interestImgPath,
              height: 40.0,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              interest.interest,
              style: cardsHeadingTextStyle,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              interest.interestDescription,
              style: cardsDescriptionTextStyle,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}

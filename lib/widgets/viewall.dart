import 'package:flutter/material.dart';
import 'package:hotel_app/utils/appstyles.dart';
import '../screen/alltickets.dart';

class ViewAll extends StatelessWidget {
  final String bigText;
  final String viewAll;
  final Widget Function(BuildContext) destinationBuilder;

  const ViewAll(
      {super.key,
      required this.bigText,
      required this.viewAll,
      required this.destinationBuilder});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bigText,
          style: Styles.headlineStyle2,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: destinationBuilder,
              ),
            );
          },
          child: Text(
            viewAll,
            style: Styles.textStyle.copyWith(color: Styles.primaryColor),
          ),
        ),
      ],
    );
  }
}

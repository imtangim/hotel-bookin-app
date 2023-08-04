import 'package:flutter/material.dart';
import 'package:hotel_app/utils/applayout.dart';
import 'package:hotel_app/utils/appstyles.dart';

class FlightData extends StatelessWidget {
  const FlightData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flights",
          style: Styles.headlineStyle1.copyWith(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(AppLayout.getHeight(10)),
          height: AppLayout.getHeight(70),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                "Sorry 🐸",
                style: Styles.headlineStyle3.copyWith(color: Colors.black),
              ),
              Text(
                "No flights are Available 🥺",
                style: Styles.headlineStyle3.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

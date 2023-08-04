import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotel_app/screen/flightdata.dart';
import 'package:hotel_app/utils/applayout.dart';
import 'package:hotel_app/utils/appstyles.dart';

import '../widgets/viewall.dart';
import 'alltickets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Container(
        margin: EdgeInsets.only(bottom: AppLayout.getHeight(55)),
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getwidth(20),
            vertical: AppLayout.getHeight(20),
          ),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              "What are\nyou looking for?",
              style: Styles.headlineStyle1.copyWith(
                fontSize: AppLayout.getwidth(35),
              ),
            ),
            Gap(AppLayout.getHeight(20)),

            FittedBox(
              child: Container(
                padding: EdgeInsets.all(AppLayout.getHeight(3.5)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(50)),
                  color: const Color(0xFFF4F6FD),
                ),
                child: Row(
                  children: [
                    //Airline Tickets
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(7)),
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(AppLayout.getHeight(50)),
                        ),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text("Airline Tickets"),
                      ),
                    ),

                    //Hotels
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(7)),
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(AppLayout.getHeight(50)),
                        ),
                        color: Colors.transparent,
                      ),
                      child: const Center(
                        child: Text("Hotels"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Textfield and buttons
            Container(
              margin: EdgeInsets.only(top: AppLayout.getHeight(18)),
              padding: EdgeInsets.all(AppLayout.getHeight(3.5)),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Departure',
                      hintStyle: Styles.headlineStyle4.copyWith(fontSize: 17),
                      prefixIcon: const Icon(
                        Icons.flight_takeoff,
                        size: 25,
                      ),
                      prefixIconColor: Colors.grey.shade500,
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: AppLayout.getwidth(8)),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: AppLayout.getwidth(50),
                        minHeight: AppLayout.getHeight(50),
                      ),
                      isDense: true,
                    ),
                  ),
                  Gap(AppLayout.getHeight(13)),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Arrival',
                      hintStyle: Styles.headlineStyle4.copyWith(fontSize: 17),
                      prefixIcon: const Icon(
                        Icons.flight_land,
                        size: 25,
                      ),
                      prefixIconColor: Colors.grey.shade500,
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: AppLayout.getwidth(8)),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: AppLayout.getwidth(50),
                        minHeight: AppLayout.getHeight(50),
                      ),
                      isDense: true,
                    ),
                  ),
                  Gap(AppLayout.getHeight(20)),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xD91130CE)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppLayout.getHeight(12)),
                          ),
                        )),
                    onPressed: () {},
                    child: SizedBox(
                      width: double.infinity,
                      height: AppLayout.getHeight(40),
                      child: Center(
                          child: Text(
                        "Find Tickets",
                        style: Styles.textStyle.copyWith(color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            ),
            Gap(AppLayout.getHeight(35)),
            ViewAll(
                bigText: "Upcoming Flights",
                viewAll: "View All",
                destinationBuilder: (context) => const FlightData()),

            Gap(AppLayout.getHeight(15)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppLayout.getHeight(430),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getHeight(15),
                      vertical: AppLayout.getHeight(15)),
                  width: size.width * 0.42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 1,
                          spreadRadius: 1,
                        )
                      ]),
                  child: Column(
                    children: [
                      Container(
                        height: AppLayout.getHeight(190),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/sit.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Gap(AppLayout.getHeight(12)),
                      Text(
                        "20% discount on the early booking of this flight. Don't miss the chance.",
                        style: Styles.headlineStyle2,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: size.width * 0.44,
                          height: AppLayout.getHeight(205),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3AB8B8),
                            borderRadius:
                                BorderRadius.circular(AppLayout.getHeight(18)),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppLayout.getHeight(15),
                            horizontal: AppLayout.getHeight(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discount\nfor survey",
                                style: Styles.headlineStyle2.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Gap(AppLayout.getHeight(10)),
                              Text(
                                "Take the survey about our service and get discount",
                                style: Styles.headlineStyle2.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: -45,
                          top: -40,
                          child: Container(
                            padding: EdgeInsets.all(AppLayout.getHeight(30)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 18,
                                color: const Color(0xFF189999),
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                        )
                      ],
                    ),
                    Gap(AppLayout.getHeight(15)),
                    Container(
                      width: size.width * 0.44,
                      height: AppLayout.getHeight(210),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getHeight(8),
                          vertical: AppLayout.getHeight(15)),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(18)),
                        color: const Color(0xFFEC6545),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Take Love",
                            style: Styles.headlineStyle2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Gap(AppLayout.getHeight(15)),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '😍',
                                  style: TextStyle(
                                      fontSize: AppLayout.getHeight(35))),
                              TextSpan(
                                  text: '🥰',
                                  style: TextStyle(
                                      fontSize: AppLayout.getHeight(50))),
                              TextSpan(
                                  text: '😘',
                                  style: TextStyle(
                                      fontSize: AppLayout.getHeight(35))),
                            ]),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

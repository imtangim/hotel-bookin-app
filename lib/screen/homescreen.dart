import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gap/gap.dart';
import 'package:hotel_app/screen/allhotel.dart';
import 'package:hotel_app/screen/alltickets.dart';
import 'package:hotel_app/screen/hotelsscreen.dart';
import 'package:hotel_app/screen/ticketcard.dart';
import 'package:hotel_app/utils/appstyles.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<Map<String, dynamic>> gethoteldata() async {
  try {
    // print("$lat $long");
    final response1 = await http.get(
      Uri.parse(
          "https://engine.hotellook.com/api/v2/lookup.json?query=Dhaka&lang=en&lookFor=both&limit=20"),
    );
    final hoteldata = jsonDecode(response1.body);
    if (hoteldata['status'] == "ok") {
      return hoteldata;
    } else {
      return {};
    }
  } on Exception catch (e) {
    throw e.toString();
  }
}

Future<Map<String, dynamic>> gethotelPrice(int hotelid) async {
  try {
    // Get the current date
    DateTime currentDate = new DateTime.now();
    String date = currentDate.toString().substring(0, 10);

    // Get tomorrow's date
    DateTime tomorrowDate = currentDate.add(const Duration(days: 1));
    String formattedTomorrowDate =
        DateFormat('yyyy-MM-dd').format(tomorrowDate);

    int hotelId = hotelid;

    final response2 = await http.get(
      Uri.parse(
          "https://engine.hotellook.com/api/v2/cache.json?location=Dhaka&hotelId=$hotelId&checkIn=$date&checkOut=$formattedTomorrowDate&currency=usd&limit=1&token=9973a4bd56d9ddc75cf4c28ae67c70ba"),
    );

    final hoteldata = jsonDecode(response2.body);
    if (hoteldata != null) {
      return hoteldata;
    } else {
      return {};
    }
  } on Exception catch (e) {
    print('Error: $e');
    throw e.toString();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    return FutureBuilder(
      future: gethoteldata(),
      builder: (context, snapshot) {
        // print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        final data = snapshot.data!;
        // print(data['results']['hotels'][0]['locationName']);
        final hotelData = data['results']['hotels'];

        return Scaffold(
          backgroundColor: Styles.bgColor,
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Gap(40),
                    Row(
                      //top part
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //for goodmorning
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning",
                              style: Styles.headlineStyle3,
                            ),
                            const Gap(5),
                            Text(
                              "Book Tickets",
                              style: Styles.headlineStyle1,
                            ),
                          ],
                        ),
                        //for picture
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/img_1.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Gap(25),
                    SizedBox(
                      height: 55,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Search',
                          hintStyle: Styles.headlineStyle4,
                          prefixIcon: const Icon(
                            FluentSystemIcons.ic_fluent_search_regular,
                            size: 25,
                          ),
                          prefixIconColor: Colors.grey.shade500,
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 40, minHeight: 50),
                          isDense: true,
                        ),
                      ),
                    ),
                    const Gap(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upcoming Flights",
                          style: Styles.headlineStyle2,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const AllTickets();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "View All",
                            style: Styles.textStyle
                                .copyWith(color: Styles.primaryColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Gap(15),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 16, right: 7),
                      child: const TicketCard(),
                    );
                  },
                ),
              ),
              const Gap(15),
              FutureBuilder(
                future: gethoteldata(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  final hoteldata = snapshot.data!;

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hotels",
                          style: Styles.headlineStyle2,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return AllHotels(
                                    data: hoteldata,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            "View All",
                            style: Styles.textStyle
                                .copyWith(color: Styles.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Gap(15),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final hotel = hotelData[index];
                    final hotelId = int.parse(hotel["id"]);

                    return FutureBuilder(
                        future: gethotelPrice(hotelId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          }
                          final price = snapshot.data!;
                          final averagePrice = price["priceAvg"].toString();

                          return Container(
                            margin: const EdgeInsets.only(left: 16, right: 3),
                            child: HotelScreen(
                              city: hotel['locationName'],
                              price: "\$$averagePrice/per Day",
                              hotelId: hotelId,
                              hotelName: hotel['fullName'],
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

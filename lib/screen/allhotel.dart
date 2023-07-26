import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hotel_app/screen/homescreen.dart';
import 'package:hotel_app/screen/hotelsscreen.dart';
import 'package:hotel_app/utils/appstyles.dart';
import 'package:intl/intl.dart';

class AllHotels extends StatefulWidget {
  final Map<String, dynamic> data;
  const AllHotels({super.key, required this.data});

  @override
  State<AllHotels> createState() => _AllHotelsState();
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
      // print(hoteldata);
      return hoteldata;
    } else {
      return {};
    }
  } on Exception catch (e) {
    print('Error: $e');
    throw e.toString();
  }
}

class _AllHotelsState extends State<AllHotels> {
  @override
  Widget build(BuildContext context) {
    final hotelData = widget.data['results']['hotels'];
    final int hotelDataLength = hotelData.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hotels",
          style: Styles.headlineStyle1.copyWith(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: hotelDataLength,
          itemBuilder: (context, index) {
            return FutureBuilder(
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
                final hotel = hotelData[index];
                final hotelId = int.parse(hotel["id"]);
                final price = snapshot.data!;
                String priceforroom = '';
                // final hotelprice = await gethotelPrice(hotelId);
                // print(hotelprice);

                return FutureBuilder(
                  future: gethotelPrice(hotelId),
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
                    final price = snapshot.data;
                    if (price != null) {
                      if (price["priceAvg"] != null) {
                        priceforroom =
                            "\$${price["priceAvg"].toString()}/per Day";
                      } else {
                        priceforroom = 'No Available';
                      }
                    }

                    return Container(
                      margin: const EdgeInsets.only(left: 16, right: 3),
                      child: HotelScreen(
                        city: hotel['locationName'],
                        price: priceforroom,
                        hotelId: hotelId,
                        hotelName: hotel['fullName'],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

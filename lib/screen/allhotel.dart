import 'dart:convert';
import 'package:hotel_app/utils/applayout.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hotel_app/screen/hotelsscreen.dart';
import 'package:hotel_app/utils/appstyles.dart';
import 'package:intl/intl.dart';

class AllHotels extends StatefulWidget {
  final Map<String, dynamic> data;
  const AllHotels({super.key, required this.data});

  @override
  State<AllHotels> createState() => _AllHotelsState();
}

Future<Map<String, dynamic>> gethotelPrice(int hotelid) async {
  try {
    // Get the current date
    DateTime currentDate = DateTime.now();
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 40.0,
                childAspectRatio: 0.60),
            itemCount: hotelDataLength,
            itemBuilder: (context, index) {
              final hotel = hotelData[index];
              final hotelId = int.parse(hotel["id"]);
              // final price = snapshot.data!;
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

                  return AspectRatio(
                    aspectRatio: 1,
                    child: SizedBox(
                      height: 400,
                      child: HotelScreen(
                        city: hotel['locationName'],
                        price: priceforroom,
                        hotelId: hotelId,
                        hotelName: hotel['fullName'],
                        imageSize: 150,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}

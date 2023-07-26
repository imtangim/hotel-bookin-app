import 'package:flutter/material.dart';
import 'package:hotel_app/screen/ticketcard.dart';
import 'package:hotel_app/utils/appstyles.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Tickets",
          style: Styles.headlineStyle1.copyWith(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 30,
            itemBuilder: (context, index) {
              return const TicketCard();
            },
          ),
        ),
      ),
    );
  }
}

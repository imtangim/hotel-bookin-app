import 'package:flutter/material.dart';
import 'package:hotel_app/screen/ticketcard.dart';
import 'package:hotel_app/utils/appstyles.dart';
import 'package:hotel_app/utils/tickets.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children:
                ticketList.map((hotel) => TicketCard(ticket: hotel)).toList(),
          ),
        ),
      ),
    );
  }
}

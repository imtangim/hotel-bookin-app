import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotel_app/utils/applayout.dart';
import 'package:hotel_app/utils/appstyles.dart';
import 'package:hotel_app/widgets/thick_container.dart';

class TicketCard extends StatelessWidget {
  final Map<String, dynamic> ticket;

  /*final String deptCode;
  final String deptCountry;
  final String desCode;
  final String desCountry;
  final String flyingTime;
  final String departureTime;
  final String date;
  final int number;*/

  const TicketCard({
    super.key,
    required this.ticket,
    /* required this.deptCode,
      required this.deptCountry,
      required this.flyingTime,
      required this.departureTime,
      required this.date,
      required this.number,
      required this.desCode,
      required this.desCountry*/
  });

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: size.width - 60,
        height: AppLayout.getHeight(200),
        child: Column(
          children: [
            // Tickets blue part
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF526799),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(21)),
                  topRight: Radius.circular(AppLayout.getHeight(21)),
                ),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  //nyc row
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style:
                            Styles.headlineStyle3.copyWith(color: Colors.white),
                      ),
                      const Spacer(),
                      const RoundContainer(),
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Flex(
                                    mainAxisSize: MainAxisSize.max,
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      (constraints.constrainWidth() / 6)
                                          .floor(),
                                      (index) => const SizedBox(
                                        width: 3,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.5,
                                child: const Icon(
                                  Icons.local_airport_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const RoundContainer(),
                      const Spacer(),
                      Text(
                        ticket['to']['code'],
                        style:
                            Styles.headlineStyle3.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getwidth(100),
                        child: Text(
                          ticket['from']['name'],
                          style: Styles.headlineStyle4.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        ticket['flying_time'],
                        style: Styles.headlineStyle3.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          ticket['to']['name'],
                          textAlign: TextAlign.end,
                          style: Styles.headlineStyle4.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Tickets orange Part
            Container(
              color: Styles.orangeColor,
              child: Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppLayout.getHeight(10)),
                          bottomRight: Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(AppLayout.getHeight(12)),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Flex(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            direction: Axis.horizontal,
                            children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => SizedBox(
                                width: AppLayout.getwidth(5),
                                height: AppLayout.getHeight(1),
                                child: const DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getwidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppLayout.getHeight(10)),
                          bottomLeft: Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Styles.orangeColor,
                borderRadius:  BorderRadius.only(
                  bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                  bottomRight: Radius.circular(AppLayout.getHeight(21)),
                ),
              ),
              padding:  EdgeInsets.all(AppLayout.getHeight(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket['date'],
                        style:
                            Styles.headlineStyle3.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Date",
                        style: Styles.headlineStyle3
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ticket['departure_time'],
                        style:
                            Styles.headlineStyle3.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Departure time",
                        style: Styles.headlineStyle3
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        ticket['number'].toString(),
                        style:
                            Styles.headlineStyle3.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Number",
                        style: Styles.headlineStyle3
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

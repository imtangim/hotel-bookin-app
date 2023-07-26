import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotel_app/utils/applayout.dart';
import 'package:hotel_app/utils/appstyles.dart';
import 'package:hotel_app/widgets/thick_container.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SizedBox(
      width: size.width - 60,
      height: 200,
      child: Column(
        children: [
          // Tickets blue part
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF526799),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(21),
                topRight: Radius.circular(21),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                //nyc row
                Row(
                  children: [
                    Text(
                      "NYC",
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
                                    (constraints.constrainWidth() / 6).floor(),
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
                      "LDN",
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
                      width: 100,
                      child: Text(
                        "New York",
                        style: Styles.headlineStyle4.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "8H 30M",
                      style: Styles.headlineStyle3.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        "London",
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
                const SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Flex(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          direction: Axis.horizontal,
                          children: List.generate(
                            (constraints.constrainWidth() / 15).floor(),
                            (index) => const SizedBox(
                              width: 5,
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
                ),
                const SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
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
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(21),
                bottomRight: Radius.circular(21),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1 May",
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
                      "08:00 AM",
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
                      "23",
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
    );
  }
}

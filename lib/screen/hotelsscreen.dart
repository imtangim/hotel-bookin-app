import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotel_app/utils/applayout.dart';
import 'package:hotel_app/utils/appstyles.dart';

class HotelScreen extends StatelessWidget {
  final String city;
  final String hotelName;
  final String price;
  final int hotelId;
  const HotelScreen(
      {super.key,
      required this.city,
      required this.price,
      required this.hotelName,
      required this.hotelId});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(top: 5, bottom: 3),
      width: size.width * 0.6,
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Styles.primaryColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://photo.hotellook.com/image_v2/limit/h$hotelId/800/520.auto',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(10),
          Text(
            hotelName,
            style: Styles.headlineStyle2.copyWith(
              color: Styles.kakicolor,
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(5),
          Text(
            city,
            style: Styles.headlineStyle3.copyWith(
              color: Colors.white,
            ),
          ),
          const Gap(8),
          Text(
            price,
            style: Styles.headlineStyle1.copyWith(
              color: Styles.kakicolor,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

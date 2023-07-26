import 'package:flutter/material.dart';
import 'package:hotel_app/screen/bottombar.dart';
import 'package:hotel_app/utils/appstyles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primary,
      ),
      home: const Bottombar(),
    );
  }
}

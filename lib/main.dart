import 'package:flutter/material.dart';
import 'package:layla_assignment/hotels_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Layla',
      debugShowCheckedModeBanner: false,
      home:HotelScreen(),
    );
  }
}

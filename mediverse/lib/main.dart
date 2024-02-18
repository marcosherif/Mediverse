import 'package:flutter/material.dart';
import 'package:mediverse/screens/DoctorDashboard/BookingDoctor.dart';
import 'package:mediverse/screens/DoctorDashboard/DoctorChat.dart';
import 'package:mediverse/screens/DoctorDashboard/widgets/BookingCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookingDoctor(),
    );
  }
}

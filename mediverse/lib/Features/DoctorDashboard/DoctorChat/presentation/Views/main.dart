import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/CameraScreen.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/DoctorChat.dart';

//fakrt a3ml notfication bs aolt fe al a5r 3ashan ha8ir tani fe configuration
//Patient chat list malhsh mock lazm  yab2a fe doc msln msh 7assha hatnf3 a3mlha now
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applfication.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        // kCameraScrenId: (context) => const CameraScreen(),
      },
      home: DoctorChat(
        patientId: '',
        doctorID: '',
      ),
    );
  }
}

import 'package:apiintergration/splashscreen.dart';
import 'package:apiintergration/userapi/userscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
       '/': (context) => const SplashScreen(),
        '/user': (context) => const PersonalDetails(),
        // '/dogsimages': (context) =>  DogImages(),
      },
    );
  }
}

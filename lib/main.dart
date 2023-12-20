import 'package:apiintergration/POST_API/RegisterSuccess/TabbarView.dart';
import 'package:apiintergration/Posts/Homescreen.dart';
import 'package:apiintergration/splashscreen.dart';

import 'package:flutter/material.dart';

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
        '/user': (context) => const Tabbarview(),
        // '/dogsimages': (context) =>  DogImages(),
      },
    );
  }
}

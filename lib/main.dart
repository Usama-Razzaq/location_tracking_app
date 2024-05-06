import 'package:flutter/material.dart';
import 'package:location_tracking_app/convert_latland_to_adress.dart';
import 'package:location_tracking_app/home_screen.dart';
import 'package:location_tracking_app/polygon_screen.dart';
import 'package:location_tracking_app/user_current_location.dart';

import 'custom_marker_info_window.dart';
import 'custon_marker_screen.dart';
import 'google_places.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => ConvertLatLangToAdress(),
      //   '/second': (context) => HomeScreen(),
      // },
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PolygoneScrenn(),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location_tracking_app/polyline_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });
    Timer(Duration(seconds: 5), () {
      // Navigate to the home screen or any other screen after 3 seconds
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => PolyLineScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var myColor=Color(0xDF3517F1);
    return Scaffold(
      backgroundColor: myColor,
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FlutterLogo(size: 100),
              ClipOval(
                child: Image.asset(
                  'assets/images/bus-station.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Location Tracking',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
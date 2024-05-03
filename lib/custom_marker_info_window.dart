import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkerInfoWindow extends StatefulWidget {
  const CustomMarkerInfoWindow({super.key});

  @override
  State<CustomMarkerInfoWindow> createState() => _CustomMarkerInfoWindowState();
}

class _CustomMarkerInfoWindowState extends State<CustomMarkerInfoWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Info Window Marker'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [

        ],
      ),
    );
  }
}

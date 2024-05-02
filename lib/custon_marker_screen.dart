import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class CustonMarkerScreen extends StatefulWidget {
  const CustonMarkerScreen({super.key});

  @override
  State<CustonMarkerScreen> createState() => _CustonMarkerScreenState();
}

class _CustonMarkerScreenState extends State<CustonMarkerScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  List<String> images = [ 'assets/images/car.png', 'assets/images/car2.png', 'assets/images/marker1.png',
    'assets/images/marker2.png', 'assets/images/marker3.png', 'assets/images/motorbike.png',
  ];
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latlng = <LatLng> [
    LatLng(33.6941, 72.9734), LatLng(33.7008, 72.9682), LatLng(33.6992, 72.9744),
    LatLng(33.6939, 72.9771), LatLng(33.6910, 72.9807), LatLng(33.7036, 72.9785)
  ];
  static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(33.6941, 72.9734),
    zoom: 15,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}


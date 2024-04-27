import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Completer<GoogleMapController> _controller= Completer();

  static final CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  List<Marker> _marker = [];
  List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.42796133580664, -122.085749655962),
    )
  ];
@override
void initState(){
  super.initState();
  _marker.addAll(_list);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: GoogleMap(
     markers: Set<Marker>.of(_marker),
     mapType: MapType.normal,
     compassEnabled: true,
     myLocationEnabled: true,
     initialCameraPosition: _kGooglePlex,
     onMapCreated: (GoogleMapController controller){
_controller.complete(controller);
     },
   ),
    );
  }
}

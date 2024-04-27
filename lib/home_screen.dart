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
      target: LatLng(31.432881646554577, 73.06686716900137),
    zoom: 14.4746,
  );

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(31.432881646554577, 73.06686716900137),
      infoWindow: InfoWindow(
        title: 'Zero Point Uaf',
      )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(31.43446004169222, 73.06751631507443),
        infoWindow: InfoWindow(
          title: 'University Market',
        )//31.43774689368027, 73.07146625925047
    ),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(31.43774689368027, 73.07146625925047),
        infoWindow: InfoWindow(
          title: 'Fateh Hall, Uaf',
        )
    ),
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(31.437833855897452, 73.07526426689694),
        infoWindow: InfoWindow(
          title: 'IBMS Gate',
        )
    ),
    Marker(
        markerId: MarkerId('5'),
        position: LatLng(31.429433582405007, 73.06660785067267),
        infoWindow: InfoWindow(
          title: 'Post Office Chowk',
        )
    ),
    Marker(
        markerId: MarkerId('6'),
        position: LatLng(31.426861174858203, 73.06392544100181),
        infoWindow: InfoWindow(
          title: 'GP Gate, UAF',
        )
    ),
    Marker(
        markerId: MarkerId('7'),
        position: LatLng(31.428615391069933, 73.07544430440495),
        infoWindow: InfoWindow(
          title: 'Main Gate, UAF',
        )
    ),
    Marker(
        markerId: MarkerId('8'),
        position: LatLng(31.506703612414928, 74.32685589498183),
        infoWindow: InfoWindow(
          title: 'Paklions Cricket Acadamy',
        )
    ),
  ];
@override
void initState(){
  super.initState();
  _marker.addAll(_list);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: SafeArea(
     child: GoogleMap(
       markers: Set<Marker>.of(_marker),
       mapType: MapType.normal,
       compassEnabled: true,
       myLocationEnabled: true,
       initialCameraPosition: _kGooglePlex,
       onMapCreated: (GoogleMapController controller){
     _controller.complete(controller);
       },
     ),
   ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async{
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(31.506703612414928, 74.32685589498183),
              zoom: 14
            ),
          ));
          setState(() {

          });
        },
      ),
    );
  }
}

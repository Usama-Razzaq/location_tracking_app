import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class PolygoneScrenn extends StatefulWidget {
  const PolygoneScrenn({super.key});

  @override
  State<PolygoneScrenn> createState() => _PolygoneScrennState();
}

class _PolygoneScrennState extends State<PolygoneScrenn> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(31.428956, 73.075258),
    zoom: 14,
  );
  final Set<Marker> _markers = {};
  Set<Polygon> _polygone = HashSet<Polygon>();

  List<LatLng> points = [
    LatLng(31.428956, 73.075258), // main gate
    LatLng(31.429742, 73.069808),// house no 5 square
    LatLng(31.430387, 73.069010),// kehkshan hall
    LatLng(31.430048, 73.067541),// home science
    LatLng(31.426759, 73.063927),// gp gate
    LatLng(31.428439, 73.065634), // Fatima hall
    LatLng(31.431031, 73.066671),// ayesha hall/babar hall
    LatLng(31.431725, 73.065088),// zainab hall
    LatLng(31.433040, 73.066870),// zero point
    LatLng(31.434183, 73.068246),// market/library
    LatLng(31.435827, 73.069772),// sir syed hall
    LatLng(31.437615, 73.071609),// Fateh hall
    LatLng(31.439167, 73.073369),// U-gate
    LatLng(31.436995, 73.075341),// nifsat
    LatLng(31.435160, 73.073477),// veternery hospital
    LatLng(31.434084, 73.072386),// CABB
    LatLng(31.432389, 73.070658),// Expo chowk
    LatLng(31.428956, 73.075258),// main gate


  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygone.add(Polygon(polygonId: PolygonId('1'),
        points: points,
    fillColor:Colors.white.withOpacity(0.2),
      strokeWidth: 4,
      strokeColor: Colors.deepOrange,
      geodesic: true,
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polygone'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
        myLocationEnabled: false,
        polygons: _polygone,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}

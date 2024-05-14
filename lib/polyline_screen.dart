import 'dart:async';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'coordinates_screen.dart';


class PolyLineScreen extends StatefulWidget {
  const PolyLineScreen({super.key});

  @override
  State<PolyLineScreen> createState() => _PolyLineScreenState();
}

class _PolyLineScreenState extends State<PolyLineScreen> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.432389, 73.070658),
    zoom: 17,
  );
  Set<Polyline> _polyLine ={};
  final Set<Marker> _markers = {};
  List<String> markerInfo = [
    ' main gate', 'house no 5 square','kehkshan hall','home science','gp gate','Fatima hall','ayesha hall/babar hall','zainab hall','zero point','market/library','sir syed hall','Fateh hall','U-gate','nifsat','veternery hospita','CABB','Expo chowk','main gate'];
  List markerID = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];

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

        for(int i = 0; i<markerInfo.length; i++){
          _markers.add(
              Marker(markerId: MarkerId(i.toString()),
                position: points[i],
                infoWindow: InfoWindow(
                  title: markerInfo[i],
                ),
                icon: BitmapDescriptor.defaultMarker,
              )
          );
        // }

      }

      setState(() {

      });

      _polyLine.add(
          Polyline(polylineId: PolylineId('1'),
            points: points,
            color: Colors.orange,
          )
      );

  }
  @override
  Widget build(BuildContext context) {
    var myColor=Color(0xDF3517F1);
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Tracking',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
        centerTitle: true,
        backgroundColor: myColor,

      ),
      body: GoogleMap(
        markers: _markers,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        polylines: _polyLine,
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          // Add your onPressed logic here
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CoordinatesScreen(
                latitude: position.latitude,
                longitude: position.longitude,
              ),
            ),
          );
        },
        shape: ContinuousRectangleBorder(),
        materialTapTargetSize: MaterialTapTargetSize.padded,
        constraints: BoxConstraints.tightFor(
          width: 100.0,
          height: 50.0,
        ),
        tooltip: 'Add',
        child: Text('Track Location'),
        elevation: 2.0,
        backgroundColor: Colors.orange,
      ),
    );
  }
}

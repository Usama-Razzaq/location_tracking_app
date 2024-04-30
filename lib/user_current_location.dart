import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:geolo';


class GetUserCurrentLocationScreen extends StatefulWidget {
  const GetUserCurrentLocationScreen({super.key});

  @override
 _GetUserCurrentLocationScreenState createState() => _GetUserCurrentLocationScreenState();
}

class _GetUserCurrentLocationScreenState extends State<GetUserCurrentLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(31.610523967649463, 74.38431688828106),
    zoom: 14,
  );
  final List<Marker> _markers =  <Marker>[
    Marker(markerId: MarkerId('1'),
      position: LatLng(31.610523967649463, 74.38431688828106),
      infoWindow: InfoWindow(
        title: 'The title of the marker',
      ),
    )
  ];

  Future<Position> getUserCurrentLocation() async{
    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace){
      print('Error' + error.toString());
    });

    return await Geolocator.getCurrentPosition();

  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
getUserCurrentLocation().then((value) async {
  print('my current location');
  print(value.latitude.toString() + ' ' + value.longitude.toString());

_markers.add(
  Marker(markerId: MarkerId('2'),
position: LatLng(value.latitude, value.longitude),
    infoWindow: InfoWindow(
      title: 'My Current Locate'
    )
  )
);
CameraPosition cameraPosition = CameraPosition(
  zoom: 14.0,
  target: LatLng(value.latitude, value.longitude),
);
final GoogleMapController controller = await _controller.future;
controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
});
        },
        child: Icon(Icons.local_activity),
      ),
    );
  }
}

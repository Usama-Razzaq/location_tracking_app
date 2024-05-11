import 'dart:async';
import 'dart:html';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CustonMarkerScreen extends StatefulWidget {
  const CustonMarkerScreen({super.key});

  @override
  State<CustonMarkerScreen> createState() => _CustonMarkerScreenState();
}

class _CustonMarkerScreenState extends State<CustonMarkerScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  Uint8List? markerImage ;
  List<String> images = [
    'assets/images/car.png',
    'assets/images/car2.png',
    'assets/images/marker1.png',
    'assets/images/marker2.png',
    'assets/images/marker3.png',
    'assets/images/motorbike.png',
  ];
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latlng = <LatLng>[
    LatLng(33.6941, 72.9734),
    LatLng(33.7008, 72.9682),
    LatLng(33.6992, 72.9744),
    LatLng(33.6939, 72.9771),
    LatLng(33.6910, 72.9807),
    LatLng(33.7036, 72.9785)
  ];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6941, 72.9734),
    zoom: 15,
  );

  Future<Uint8List> getBytesFromAssests(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  @override
  void initState(){
    super.initState();
    loadData();
  }
  loadData() async{
    for(int i =0; i<images.length; i++){
      final Uint8List markerIcon = await getBytesFromAssests(images[i], 100);
      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: _latlng[i],
        icon: BitmapDescriptor.fromBytes(markerIcon),
        infoWindow: InfoWindow(
          title: 'This is the title marker:' + i.toString(),
        )
      ));
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          markers: Set<Marker>.of(_markers),
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}


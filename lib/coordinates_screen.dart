// import 'package:flutter/material.dart';
//
// class CoordinatesScreen extends StatefulWidget {
//   final double latitude;
//   final double longitude;
//
//   CoordinatesScreen({required this.latitude, required this.longitude});
//
//   @override
//   State<CoordinatesScreen> createState() => _CoordinatesScreenState();
// }
//
// class _CoordinatesScreenState extends State<CoordinatesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Coordinates'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Latitude: ${widget.latitude}'),
//             Text('Longitude: ${widget.longitude}'),
//           ],
//         ),
//       ),
//     );
//   }
// }

////// new code

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class CoordinatesScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  CoordinatesScreen({required this.latitude, required this.longitude});

  @override
  _CoordinatesScreenState createState() => _CoordinatesScreenState();
}

class _CoordinatesScreenState extends State<CoordinatesScreen> {
  String? _address;

  @override
  void initState() {
    super.initState();
    _getAddressFromCoordinates();
  }

  Future<void> _getAddressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        widget.latitude,
        widget.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        setState(() {
          _address =
              "${placemark.street}, ${placemark.locality}, ${placemark.country}";
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        _address = "Address not found";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var myColor = Color(0xDF3517F1);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Address',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: myColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  height: 50,
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
            'Your Current Position',
                    style: TextStyle(
                      fontSize: 20,
                    ),
          ))),
          SizedBox(height: 20,),
          Center(
            child: _address != null
                ? Text(
                    'Address: $_address',
                    textAlign: TextAlign.center,
                  )
                : CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

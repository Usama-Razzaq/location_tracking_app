
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
//
// class ConvertLatLangToAdress extends StatefulWidget {
//   const ConvertLatLangToAdress({super.key});
//
//   @override
//   State<ConvertLatLangToAdress> createState() => _ConvertLatLangToAdressState();
// }
//
// class _ConvertLatLangToAdressState extends State<ConvertLatLangToAdress> {
//   String placeM = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Map'),
//         centerTitle: true,
//       ),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             GestureDetector(
//               // from coordinates to address
//               onTap: (){
//
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 50.0,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                 ),
//                 child: Center(
//                   child: Text('convert',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),),
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//   }
// }







// chat gpt example which works

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';


class ConvertLatLangToAdress extends StatefulWidget {
  const ConvertLatLangToAdress({Key? key}) : super(key: key);

  @override
  _ConvertAddressToLatLngState createState() => _ConvertAddressToLatLngState();
}

class _ConvertAddressToLatLngState extends State<ConvertLatLangToAdress> {
  String address = "naseer abad metro station lahore"; // Example address
  double latitude = 31.43623932607555;
  double longitude = 73.06798242822221;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address to LatLng'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitude: ${latitude}'),
            Text('Longitude: $longitude'),
            Text(address),
            ElevatedButton(
              // on press function to get coordinates from address
              onPressed: () async {
                List<Location> locations = await locationFromAddress(address);
                print(locations);
                setState(() {
                  latitude = locations.first.latitude;
                  longitude = locations.first.longitude;

                });
              },

              // on press function to get address from coordinates
    //           onPressed: () async{
    // List<Placemark> placemarks = await placemarkFromCoordinates(33.6941, 72.9734);
    // setState(() {
    // address = "${placemarks.reversed.first.country}, ${placemarks.reversed.last.locality}, ${placemarks.reversed.last.street}, ${placemarks.reversed.last.name}";
    // });
    // },
              child: Text('Convert LatLng'),
            ),
          ],
        ),
      ),
    );
  }
}

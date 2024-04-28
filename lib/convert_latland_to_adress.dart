import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLangToAdress extends StatefulWidget {
  const ConvertLatLangToAdress({super.key});

  @override
  State<ConvertLatLangToAdress> createState() => _ConvertLatLangToAdressState();
}

class _ConvertLatLangToAdressState extends State<ConvertLatLangToAdress> {
  String placeM = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 200.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(placeM),
            GestureDetector(
              // from coordinates to address
             onTap: (){

             },
              child: Container(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                child: Text('convert',
                style: TextStyle(
                  color: Colors.white,
                ),),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}

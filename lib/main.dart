import 'dart:async';


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConvertGeocodesToAddress(),
    );
  }
}

class ConvertGeocodesToAddress extends StatefulWidget {
 // ConvertGeocodesToAddress({Key key}) : super(key: key);

  @override
  _ConvertGeocodesToAddressState createState() => _ConvertGeocodesToAddressState();
}

class _ConvertGeocodesToAddressState extends State<ConvertGeocodesToAddress> {
  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;
  
  
  @override
  void initState(){
    super.initState();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    _streamSubscription= Geolocator().getPositionStream(locationOptions).listen((Position position) {
      setState(() {
        print(position);
        _position = position;

        final Coordinates = new Coordinates(position.latitude, position.longitude);
        convertCoordinatesToAddress(coordinates).then((value)=> _address=value);
      });
     });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Convert geocodes to adress"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 300,),
            Text("Locationlat:${_position?.latitude?? '-'}, lon:${_position?.longitude?? '-'}"),
            SizedBox(height: 50,),
            Text("Address  from coordinates"),
            SizedBox(height: 20,),
            Text("${_address?.addressLine?? '-'}"),
          ],
        )
      )
    );
    
  }
  @override
  void dispose(){
    super.dispose();
    _streamSubscription.cancel();
  }
  Future<Address> convertCoordinatesToAddress(Coordinates coordinates) async{
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first;

  }
}
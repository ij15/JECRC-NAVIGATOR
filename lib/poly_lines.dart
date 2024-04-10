import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polylines extends StatefulWidget {
  const Polylines({super.key});

  @override
  State<Polylines> createState() => _PolylinesState();
}

class _PolylinesState extends State<Polylines> {

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kgoogleplex = CameraPosition(
    target: LatLng(26.78309, 75.82045),
    zoom: 19.15772545,

  );
  final Set<Marker> _marker ={};
  final Set<Polyline> _polyline={};

  List<LatLng> latlng =[
    const LatLng(26.78192,75.82156),
    const LatLng(26.78217,75.8216),
    const LatLng(26.78217,75.82105),
    const LatLng(26.78293,75.82053),
   const LatLng(26.78309,75.8204),

  ];
  @override
  void initState(){
    super.initState();

    for(int i=0;i<latlng.length;i++){
      _marker.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: latlng[i],
          infoWindow: const InfoWindow(
           // title: 'A Block',
          ),
          icon: BitmapDescriptor.defaultMarker,

        )
      );
      setState(() {

      });
      _polyline.add(
        Polyline(polylineId: const PolylineId('1'),
            points: latlng,
          color: Colors.blue
        ),

      );
    }
  }
  Future<Position> getUserCurrentLocation() async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace) {
      //print("error"+error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: const Text('GH'),
      ),
      body:GoogleMap(
        markers: _marker,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        polylines: _polyline,
        myLocationEnabled: true,
        initialCameraPosition: _kgoogleplex,
        mapType: MapType.normal,
      ),
        floatingActionButton: FloatingActionButton(

        onPressed: (){

      getUserCurrentLocation().then((value) async {
        //print('my current location');

        //print(value.latitude.toString() +" " + value.longitude.toString());

        _marker.add(
            Marker(
                markerId:const MarkerId('4'),
                position:LatLng(value.latitude ,value.longitude),
                //icon: BitmapDescriptor.hueCyan,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),


                infoWindow: const InfoWindow(

                    title: "My current location"
                )
            )
        );

        CameraPosition cameraPosition=CameraPosition(
            zoom: 19.1432678,
            target: LatLng(value.latitude ,value.longitude));

        final GoogleMapController controller =await _controller.future;

        controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
        setState(() {

        });

      });

    },
    child: const Icon(Icons.local_bar ),
    ),
    );
  }
}

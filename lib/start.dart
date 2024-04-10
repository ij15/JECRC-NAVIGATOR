import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class  Start extends StatefulWidget {
 // const Start({super.key});
  List<LatLng> lista=[];
  Start(this.lista, {super.key});

  @override
  State <Start> createState() => _start();
}
class _start extends State<Start> {
  final Completer<GoogleMapController> _controller = Completer();
  //static const CameraPosition _kgoogleplex =
  final Set<Polyline> _polyline={};
  @override
  void initState(){
    super.initState();
        Marker(
          markerId: MarkerId(0.toString()),
          position: widget.lista[0],
          infoWindow: const InfoWindow(
            // title: 'A Block',
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

    for(int i=0;i<widget.lista.length;i++){

      setState(() {

      });
      _polyline.add(
        Polyline(polylineId: const PolylineId('1'),
            points: widget.lista,
            color: Colors.blue,
            startCap: Cap.buttCap,
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
        title: const Text('Directions'),
      ),
      body:GoogleMap(

        markers: {
          // Marker(
          //     markerId: const MarkerId('2'),
          //     position: widget.lista[0],
          //     infoWindow: const InfoWindow(
          //         title: 'Starting point'
          //
          //     )
          // ),
          Marker(
              markerId: const MarkerId('3'),
              position: widget.lista[widget.lista.length-1],
              infoWindow: const InfoWindow(
                  title: 'Destination point'

              )
          ),
        },
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        polylines: _polyline,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: widget.lista[0] ,
          //zoom: 19.15772545,
          zoom: 17,

        ),
        mapType: MapType.normal,
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){

          getUserCurrentLocation().then((value) async {
            //print('my current location');
            //print(value.latitude.toString() +" " + value.longitude.toString());
                Marker(
                    markerId:const MarkerId('4'),
                    position:LatLng(value.latitude ,value.longitude),
                    //icon: BitmapDescriptor.hueCyan,
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                    infoWindow: const InfoWindow(
                        title: "My current location"
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
